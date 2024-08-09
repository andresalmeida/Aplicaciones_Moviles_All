// lib/HomePage.dart

import 'package:flutter/material.dart';
import 'Pages/APIPages.dart';
import 'Pages/MarvelAPI.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo oscuro
      appBar: AppBar(
        title: Text(
          "SELECCIONE ESA API 🤑",
          style: TextStyle(color: Colors.white), // Texto blanco en la AppBar
        ),
        backgroundColor: Colors.orange, // Color de la barra de navegación
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/non.gif', // Ruta a tu GIF local
                width: 500, // Ancho del GIF
                height: 500, // Alto del GIF
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => APIPages()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.green), // Fondo rojo para el botón
                      foregroundColor: MaterialStateProperty.all(
                          Colors.white), // Texto blanco
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Bordes redondeados
                        ),
                      ),
                      elevation: MaterialStateProperty.all(3), // Sombra suave
                    ),
                    child: Text(
                      'API GIFS',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MarvelAPI()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.red), // Fondo azul para el botón
                      foregroundColor: MaterialStateProperty.all(
                          Colors.white), // Texto blanco
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Bordes redondeados
                        ),
                      ),
                      elevation: MaterialStateProperty.all(3), // Sombra suave
                    ),
                    child: Text(
                      'API MARVEL',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
