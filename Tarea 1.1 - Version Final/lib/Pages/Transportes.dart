import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transportes extends StatefulWidget {
  /*aca van las inicializaciones*/
  @override
  _TransporteState createState() => _TransporteState();
}

class _TransporteState extends State<Transportes> {
  String _pasajeros = '';
  String _kilometros = '';
  double _precioUnit = 0;
  double _precioTot = 0;
  double _precioBase = 0;
  String _resultado = '';

  void calculoBusA() {
    double pasajeros = double.tryParse(_pasajeros) ?? 1;
    double kilometros = double.tryParse(_kilometros) ?? 1;

    if (pasajeros < 20) {
      _precioBase = kilometros * 20 * 2;
      setState(() {
        _resultado = 'Calculo en base al mínimo de 20 pasajeros: $_precioBase';
      });
    } else if (pasajeros > 20 && kilometros > 0 ) {
      _precioTot = kilometros * pasajeros * 2;
      _precioUnit = _precioTot / pasajeros;
      setState(() {
        _resultado =
        'El valor total es: $_precioTot y el valor por pasajero es: $_precioUnit';
      });
    } else {
      setState(() {
        _resultado = 'Valores incorrectos';
      });
    }
  }

  void calculoBusB() {
    double pasajeros = double.tryParse(_pasajeros) ?? 1;
    double kilometros = double.tryParse(_kilometros) ?? 1;

    if (pasajeros < 20) {
      _precioBase = kilometros * 20 * 2.5;
      setState(() {
        _resultado = 'Calculo en base al mínimo de 20 pasajeros: $_precioBase';
      });
    } else if (pasajeros > 20 && kilometros > 0 ) {
      _precioTot = kilometros * pasajeros * 2;
      _precioUnit = _precioTot / pasajeros;
      setState(() {
        _resultado =
        'El valor total es: $_precioTot y el valor por pasajero es: $_precioUnit';
      });
    } else {
      setState(() {
        _resultado = 'Valores incorrectos';
      });
    }
  }


  void calculoBusC() {
    double pasajeros = double.tryParse(_pasajeros) ?? 1;
    double kilometros = double.tryParse(_kilometros) ?? 1;

    if (pasajeros < 20) {
      _precioBase = kilometros * 20 * 3;
      setState(() {
        _resultado = 'Calculo en base al mínimo de 20 pasajeros: $_precioBase';
      });
    } else if (pasajeros > 20 && kilometros > 0) {
      _precioTot = kilometros * pasajeros * 2;
      _precioUnit = _precioTot / pasajeros;
      setState(() {
        _resultado =
        'El valor total es: $_precioTot y el valor por pasajero es: $_precioUnit';
      });
    } else {
      setState(() {
        _resultado = 'Valores incorrectos';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
              text: "S",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
              children: [
                TextSpan(
                  text: "istema de ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextSpan(
                  text: "T",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                TextSpan(
                  text: "ransporte",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ]),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                _pasajeros = value;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Pasajeros:',
                hintText: 'Ingrese número de pasajeros',
              ),
            ),
            TextField(
              onChanged: (value) {
                _kilometros = value;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Kilometros:',
                hintText: 'Ingrese la distancia de viaje en Km',
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Seleccione el tipo de bus en el que desea viajar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: calculoBusA,
                  child: Text('BUS A'),
                ),
                ElevatedButton(
                  onPressed: calculoBusB,
                  child: Text('BUS B'),
                ),
                ElevatedButton(
                  onPressed: calculoBusC,
                  child: Text('BUS C'),
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              _resultado,
              style: TextStyle(fontSize: 20, color: Colors.blue),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
