import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Datos.dart';

class BienvenidoPage extends StatelessWidget{
  //DECLARAR UNA VARIABLE PARA ALMACENAR NOMBRE DEL USUARIO EN ESTA VENTANA
  final String username;
  //CONSTRUCTOR
  BienvenidoPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             'Bienvenido mi estimado, $username',
             style: TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.bold,
             ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
              child: Text('Regrese al inicio, papi'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DatosPage()), );
              },
              child: Text('Ingrese los datos, mi loco'),
            ),
          ],
        ),
      )
    );

  }

}