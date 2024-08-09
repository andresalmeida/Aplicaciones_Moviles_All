import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PantallaPrincipal1(),
    );
  }
}

class PantallaPrincipal1 extends StatefulWidget {
  @override
  _EstadoPantallaPrincipal1 createState() => _EstadoPantallaPrincipal1();
}

class _EstadoPantallaPrincipal1 extends State<PantallaPrincipal1> {
  int _indiceSeleccionado = 0;

  static List<Widget> _opcionesWidget = <Widget>[
    PaginaInicio(),
    PaginaNumeroCapicua(),
    PaginaPalindromo(),
    PaginaMultiplosTres(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _mostrarBienvenida());
  }

  void _mostrarBienvenida() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '¡Bienvenido!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Gracias por usar nuestra aplicación. Explora las diferentes funciones usando la barra de navegación.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Cerrar'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void _enItemTocado(int indice) {
    if (indice == 4) {
      _mostrarBottomSheet();
    } else {
      setState(() {
        _indiceSeleccionado = indice;
      });
    }
  }

  void _mostrarBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'OJITO PUES🫣',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Esta es una aplicación de ejemplo que muestra diferentes funcionalidades de Flutter.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Se pueden hacer muchas cosas bb, se puede sumar, restar, multiplicar, dividir, y las funciones de abajo pues, ahi pa que las revise',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Cerrar'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navegación con Drawer y Bottom Navigation'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Operaciones Matemáticas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Suma'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaginaSuma()));
              },
            ),
            ListTile(
              leading: Icon(Icons.remove),
              title: Text('Resta'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaginaResta()));
              },
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Multiplicación'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaginaMultiplicacion()));
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('División'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaginaDivision()));
              },
            ),
          ],
        ),
      ),
      body: _opcionesWidget.elementAt(_indiceSeleccionado),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: 'Capicúa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_rotation_none),
            label: 'Palíndromo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Múltiplos de 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Información',
          )
        ],
        currentIndex: _indiceSeleccionado,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _enItemTocado,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class PaginaSuma extends StatefulWidget {
  @override
  _PaginaSumaState createState() => _PaginaSumaState();
}

class _PaginaSumaState extends State<PaginaSuma> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _num1Controller = TextEditingController();
  TextEditingController _num2Controller = TextEditingController();
  String _resultado = '';

  void _calcularSuma() {
    if (_formKey.currentState!.validate()) {
      double num1 = double.parse(_num1Controller.text);
      double num2 = double.parse(_num2Controller.text);
      setState(() {
        _resultado = 'Resultado: ${num1 + num2}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Suma')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _num1Controller,
                decoration: InputDecoration(labelText: 'Número 1'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _num2Controller,
                decoration: InputDecoration(labelText: 'Número 2'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _calcularSuma,
                child: Text('Sumar'),
              ),
              Text(_resultado, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'HOLAAAAAAA 🐸\n\n'
          'Use el menú lateral para acceder a las operaciones matemáticas '
          'o sino, la barra de navegación inferior para otras funciones.\n Sino nada pues ya no hay más 🤡',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class PaginaResta extends StatefulWidget {
  @override
  _PaginaRestaState createState() => _PaginaRestaState();
}

class _PaginaRestaState extends State<PaginaResta> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _num1Controller = TextEditingController();
  TextEditingController _num2Controller = TextEditingController();
  String _resultado = '';

  void _calcularResta() {
    if (_formKey.currentState!.validate()) {
      double num1 = double.parse(_num1Controller.text);
      double num2 = double.parse(_num2Controller.text);
      setState(() {
        _resultado = 'Resultado: ${num1 - num2}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resta')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _num1Controller,
                decoration: InputDecoration(labelText: 'Número 1'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _num2Controller,
                decoration: InputDecoration(labelText: 'Número 2'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _calcularResta,
                child: Text('Restar'),
              ),
              Text(_resultado, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginaMultiplicacion extends StatefulWidget {
  @override
  _PaginaMultiplicacionState createState() => _PaginaMultiplicacionState();
}

class _PaginaMultiplicacionState extends State<PaginaMultiplicacion> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _num1Controller = TextEditingController();
  TextEditingController _num2Controller = TextEditingController();
  String _resultado = '';

  void _calcularMultiplicacion() {
    if (_formKey.currentState!.validate()) {
      double num1 = double.parse(_num1Controller.text);
      double num2 = double.parse(_num2Controller.text);
      setState(() {
        _resultado = 'Resultado: ${num1 * num2}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multiplicación')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _num1Controller,
                decoration: InputDecoration(labelText: 'Número 1'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _num2Controller,
                decoration: InputDecoration(labelText: 'Número 2'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _calcularMultiplicacion,
                child: Text('Multiplicar'),
              ),
              Text(_resultado, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginaDivision extends StatefulWidget {
  @override
  _PaginaDivisionState createState() => _PaginaDivisionState();
}

class _PaginaDivisionState extends State<PaginaDivision> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _num1Controller = TextEditingController();
  TextEditingController _num2Controller = TextEditingController();
  String _resultado = '';

  void _calcularDivision() {
    if (_formKey.currentState!.validate()) {
      double num1 = double.parse(_num1Controller.text);
      double num2 = double.parse(_num2Controller.text);
      if (num2 != 0) {
        setState(() {
          _resultado = 'Resultado: ${num1 / num2}';
        });
      } else {
        setState(() {
          _resultado = 'Error: No se puede dividir por cero';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('División')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _num1Controller,
                decoration: InputDecoration(labelText: 'Número 1'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _num2Controller,
                decoration: InputDecoration(labelText: 'Número 2'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _calcularDivision,
                child: Text('Dividir'),
              ),
              Text(_resultado, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginaNumeroCapicua extends StatefulWidget {
  @override
  _PaginaNumeroCapicuaState createState() => _PaginaNumeroCapicuaState();
}

class _PaginaNumeroCapicuaState extends State<PaginaNumeroCapicua> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numeroController = TextEditingController();
  String _resultado = '';

  bool _esCapicua(String numero) {
    return numero == numero.split('').reversed.join('');
  }

  void _verificarCapicua() {
    if (_formKey.currentState!.validate()) {
      String numero = _numeroController.text;
      setState(() {
        _resultado = _esCapicua(numero)
            ? '$numero es un número capicúa'
            : '$numero no es un número capicúa';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _numeroController,
              decoration: InputDecoration(labelText: 'Ingrese un número'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese un número';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _verificarCapicua,
              child: Text('Verificar Capicúa'),
            ),
            Text(_resultado, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class PaginaPalindromo extends StatefulWidget {
  @override
  _PaginaPalindromoState createState() => _PaginaPalindromoState();
}

class _PaginaPalindromoState extends State<PaginaPalindromo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _palabraController = TextEditingController();
  String _resultado = '';

  bool _esPalindromo(String palabra) {
    String palabraNormalizada =
        palabra.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
    return palabraNormalizada == palabraNormalizada.split('').reversed.join('');
  }

  void _verificarPalindromo() {
    if (_formKey.currentState!.validate()) {
      String palabra = _palabraController.text;
      setState(() {
        _resultado = _esPalindromo(palabra)
            ? '"$palabra" es un palíndromo'
            : '"$palabra" no es un palíndromo';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _palabraController,
              decoration:
                  InputDecoration(labelText: 'Ingrese una palabra o frase'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una palabra o frase';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _verificarPalindromo,
              child: Text('Verificar Palíndromo'),
            ),
            Text(_resultado, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class PaginaMultiplosTres extends StatefulWidget {
  @override
  _PaginaMultiplosTresState createState() => _PaginaMultiplosTresState();
}

class _PaginaMultiplosTresState extends State<PaginaMultiplosTres> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _limiteController = TextEditingController();
  List<int> _multiplos = [];

  void _generarMultiplos() {
    if (_formKey.currentState!.validate()) {
      int limite = int.parse(_limiteController.text);
      setState(() {
        _multiplos = List.generate((limite / 3).floor(), (i) => (i + 1) * 3);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _limiteController,
              decoration: InputDecoration(labelText: 'Ingrese el límite'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese un número';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _generarMultiplos,
              child: Text('Generar Múltiplos de 3'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _multiplos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_multiplos[index].toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
