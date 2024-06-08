// lib/main.dart
import 'package:flutter/material.dart';
import 'ejercicio1_screen.dart';
import 'ejercicio2_screen.dart';
import 'ejercicio3_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedRadio = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedRadio = value!;
    });

    if (_selectedRadio == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Ejercicio1Screen()),
      );
    } else if (_selectedRadio == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Ejercicio2Screen()),
      );
    } else if (_selectedRadio == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Ejercicio3Screen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Ejercicio 1'),
            leading: Radio(
              value: 1,
              groupValue: _selectedRadio,
              onChanged: _handleRadioValueChange,
            ),
          ),
          ListTile(
            title: const Text('Ejercicio 2'),
            leading: Radio(
              value: 2,
              groupValue: _selectedRadio,
              onChanged: _handleRadioValueChange,
            ),
          ),
          ListTile(
            title: const Text('Ejercicio 3'),
            leading: Radio(
              value: 3,
              groupValue: _selectedRadio,
              onChanged: _handleRadioValueChange,
            ),
          ),
        ],
      ),
    );
  }
}
