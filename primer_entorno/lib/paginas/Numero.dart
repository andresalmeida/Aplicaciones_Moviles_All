import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numero Randomico".toUpperCase()),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text("Numero randomico es: ${obtenerNumero()}",),
      ),
    );
  }
}

//Creacion de la funcion obtenerNumero
int obtenerNumero(){
  Random random = new Random();
  var numero = random.nextInt(100);
  return numero;
}