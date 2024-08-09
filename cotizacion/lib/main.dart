import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StockModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cotizaciones de Bolsa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentStockIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(const Duration(seconds: 5), (Timer t) => _changeStock());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _changeStock() {
    setState(() {
      final stockModel = Provider.of<StockModel>(context, listen: false);
      if (stockModel.stocks.isNotEmpty) {
        currentStockIndex = (currentStockIndex + 1) % stockModel.stocks.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotizaciones de Bolsa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            ),
          ),
        ],
      ),
      body: Center(
        child: Consumer<StockModel>(
          builder: (context, stockModel, child) {
            if (stockModel.stocks.isEmpty) {
              return const Text(
                  'No hay acciones seleccionadas. Busca y añade algunas.');
            }
            final stock = stockModel.stocks[currentStockIndex];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(stock: stock)),
                );
              },
              child: StockWidget(stock: stock),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StockListPage()),
        ),
        tooltip: 'Ver lista de acciones',
        child: const Icon(Icons.list),
      ),
    );
  }
}

class StockWidget extends StatelessWidget {
  final Stock stock;

  const StockWidget({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.trending_up, color: Colors.white, size: 40),
          const SizedBox(height: 10),
          Text(
            stock.symbol,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '\$${stock.price.toStringAsFixed(2)}',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            '${stock.change > 0 ? '+' : ''}${stock.change.toStringAsFixed(2)}',
            style: TextStyle(
              color: stock.change > 0 ? Colors.green[300] : Colors.red[300],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Stock stock;

  const DetailPage({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de ${stock.symbol}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stock.symbol,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Precio actual:',
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    Text(
                      '\$${stock.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text('Cambio:',
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    Text(
                      '${stock.change > 0 ? '+' : ''}${stock.change.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: stock.change > 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Acciones'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Símbolo de la acción',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _searchQuery = _controller.text;
                    });
                    Provider.of<StockModel>(context, listen: false)
                        .searchStock(_searchQuery);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<StockModel>(
              builder: (context, stockModel, child) {
                if (stockModel.errorMessage != null) {
                  return Center(
                      child: Text('Error: ${stockModel.errorMessage}'));
                }
                if (stockModel.searchResult == null) {
                  return const Center(child: Text('Busca una acción'));
                }
                if (stockModel.searchResult!.isEmpty) {
                  return const Center(
                      child: Text('No se encontraron resultados'));
                }
                return ListView.builder(
                  itemCount: stockModel.searchResult!.length,
                  itemBuilder: (context, index) {
                    final stock = stockModel.searchResult![index];
                    return ListTile(
                      title: Text(stock.symbol),
                      subtitle: Text('\$${stock.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          stockModel.addStock(stock);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('${stock.symbol} añadido a la lista')),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StockListPage extends StatelessWidget {
  const StockListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Acciones'),
      ),
      body: Consumer<StockModel>(
        builder: (context, stockModel, child) {
          if (stockModel.stocks.isEmpty) {
            return const Center(child: Text('No hay acciones seleccionadas'));
          }
          return ListView.builder(
            itemCount: stockModel.stocks.length,
            itemBuilder: (context, index) {
              final stock = stockModel.stocks[index];
              return ListTile(
                title: Text(stock.symbol),
                subtitle: Text('\$${stock.price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    stockModel.removeStock(stock);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(stock: stock)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class Stock {
  final String symbol;
  final double price;
  final double change;

  Stock({required this.symbol, required this.price, required this.change});

  factory Stock.fromJson(Map<String, dynamic> json) {
    final data = json['Global Quote'];
    return Stock(
      symbol: data['01. symbol'],
      price: double.parse(data['05. price']),
      change: double.parse(data['09. change']),
    );
  }
}

class StockService {
  final String apiKey =
      'NN6BI06NDRMUNHR2'; // Reemplaza con tu clave de API real

  Future<Stock> getStockQuote(String symbol) async {
    final response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$symbol&apikey=$apiKey'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse.containsKey('Global Quote') &&
          jsonResponse['Global Quote'].isNotEmpty) {
        return Stock.fromJson(jsonResponse);
      } else {
        throw Exception('No se encontraron datos para el símbolo: $symbol');
      }
    } else {
      throw Exception('Error en la solicitud: ${response.statusCode}');
    }
  }
}

class StockModel extends ChangeNotifier {
  final StockService _stockService = StockService();
  final List<Stock> _stocks = [];
  List<Stock>? _searchResult;
  String? _errorMessage;

  List<Stock> get stocks => _stocks;
  List<Stock>? get searchResult => _searchResult;
  String? get errorMessage => _errorMessage;

  Future<void> searchStock(String symbol) async {
    try {
      _errorMessage = null;
      final stock = await _stockService.getStockQuote(symbol);
      _searchResult = [stock];
      notifyListeners();
    } catch (e) {
      _searchResult = [];
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  void addStock(Stock stock) {
    if (!_stocks.any((s) => s.symbol == stock.symbol)) {
      _stocks.add(stock);
      notifyListeners();
    }
  }

  void removeStock(Stock stock) {
    _stocks.removeWhere((s) => s.symbol == stock.symbol);
    notifyListeners();
  }

  Future<void> refreshStocks() async {
    for (int i = 0; i < _stocks.length; i++) {
      try {
        final updatedStock =
            await _stockService.getStockQuote(_stocks[i].symbol);
        _stocks[i] = updatedStock;
      } catch (e) {
        print('Error updating ${_stocks[i].symbol}: $e');
      }
    }
    notifyListeners();
  }
}
