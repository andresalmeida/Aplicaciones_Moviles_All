// CREACION DE SEGUNDA PANTALLA

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallasNu extends StatefulWidget {
  @override
  State<PantallasNu> createState() => _PantallaNuState();
}

class _PantallaNuState extends State<PantallasNu> {

  //CODIFICACION - Agregar boton para volver a la pantalla principal
  final _num1=TextEditingController();
  final _num2=TextEditingController();
  final _num3=TextEditingController();

  //VARIABLE PARA ALMACENAR NUMERO MAYOR
  String _resultado='';



  //DISEÑO
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AGREGAR APPBAR
      appBar: AppBar(
        title: Text("Menú Números"),
        backgroundColor: Colors.lightGreen,
        titleTextStyle: TextStyle(fontFamily: 'CustomFont', fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Text("Pantalla para verificar número mayor",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,),

          TextField(
            controller: _num1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Ingrese el primer número',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 32,),

          TextField(
            controller: _num2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Ingrese el segundo número',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 32,),

          TextField(
            controller: _num3,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Ingrese el tercer número',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 16.0),

          ElevatedButton(
            onPressed: encontrarMayor, // Aquí se llama a _encontrarMayor
            child: Text('Calcular'),
            style: ElevatedButton.styleFrom(),
          ),
          SizedBox(height: 16.0),
          Text(_resultado, style: TextStyle(fontSize: 15),),



        ],
      ),

    );



  }

  //METODO PARA ENCONTRAR EL NUMERO MAYOR
  void encontrarMayor(){
    int num1=int.parse(_num1.text);
    int num2=int.parse(_num2.text);
    int num3=int.parse(_num3.text);

    //VERIFICAR SI TENGO CAJAS DE TEXTO VACIAS
    if(num1 !=null && num2 !=null && num3 !=null){
      //VERIFICAR SI LOS NUMEROS ESTAN EN UN RANGO DEL 1 AL 100
      if((num1 >=1 && num1<=100)&&(num2 >=1 && num2<=100)&&(num3 >=1 && num3 <=100)){
        setState(() {
          _resultado='El número mayor es ${mayor(num1, num2, num3)}';
        });

      } else {
        setState(() {
          _resultado='Los números deben estar entre el 1 y el 100';
        });
      }

    } else {
      _resultado='Debe ingresar números válidos';
    }
}

//METODO PARA ENCONTRAR EL NUMERO MAYOR ENTRE LOS TRES NUMEROS
int mayor(int num1, int num2, int num3){
    if(num1 > num2 && num1 > num3){
      return num1;
    }
    else {
      if(num2 > num3){
        return num2;
      }
      else {
        return num3;
      }
    }

}





}





//      body: Center(
//        child: ElevatedButton(
//          onPressed: (){},
//          child: const Text("Pantalla Número Mayor"),

//      ),
//    );