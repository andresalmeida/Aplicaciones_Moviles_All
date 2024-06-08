import 'package:flutter/material.dart';

class GuesasApp extends StatefulWidget {
  @override
  _GuesasAppState createState() => _GuesasAppState();
}

class _GuesasAppState extends State<GuesasApp> {
  @override
  Widget build(BuildContext context) {
    return BurgerApp();
  }
}

class BurgerApp extends StatelessWidget {
  const BurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El Náufrago Satisfecho',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BurgerCalculator(),
    );
  }
}

class BurgerCalculator extends StatefulWidget {
  const BurgerCalculator({super.key});

  @override
  BurgerCalculatorState createState() => BurgerCalculatorState();
}

class BurgerCalculatorState extends State<BurgerCalculator> {
  final Map<String, double> burgerPrices = {
    'Sencilla': 20.0,
    'Doble': 25.0,
    'Triple': 28.0,
  };
  String selectedBurger = 'Sencilla';
  int quantity = 1;
  double totalPrice = 0.0;

  void calculateTotalPrice() {
    double price = burgerPrices[selectedBurger]!;
    double subtotal = price * quantity;
    double finalPrice = subtotal * 1.05;
    setState(() {
      totalPrice = finalPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('El Náufrago Satisfecho'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Seleccione el tipo de hamburguesa:'),
            DropdownButton<String>(
              value: selectedBurger,
              onChanged: (String? newValue) {
                setState(() {
                  selectedBurger = newValue!;
                });
              },
              items: burgerPrices.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Ingrese la cantidad de hamburguesas:'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  quantity = int.tryParse(value) ?? 1;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cantidad',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateTotalPrice,
              child: const Text('Calcular Precio Total'),
            ),
            const SizedBox(height: 20),
            Text('Precio Total: \$${totalPrice.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
