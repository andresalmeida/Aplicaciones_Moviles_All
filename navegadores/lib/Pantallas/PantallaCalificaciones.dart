// CREACION DE TERCERA PANTALLA

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallasCa extends StatefulWidget {
  @override
  State<PantallasCa> createState() => _PantallaCaState();
}

class _PantallaCaState extends State<PantallasCa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AGREGAR APPBAR
      appBar: AppBar(
        title: Text("Menú Calificaciones"),
        backgroundColor: Colors.lightBlue,
        titleTextStyle: TextStyle(fontFamily: 'CustomFont', fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){},
          child: const Text("Pantalla Calificaciones"),
        ),
      ),
    );

  }
}