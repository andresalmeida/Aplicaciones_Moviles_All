import 'package:flutter/material.dart';


class Triangulos extends StatefulWidget{
  @override
  _TrianguloState createState() => _TrianguloState();
}

class _TrianguloState extends State<Triangulos>{

  /*Declaracion de Variables*/

  String _lado1='';
  String _lado2='';
  String _lado3='';
  String _tipoTriangulo='';

  /*Funcion Verificar*/
  void verificarTriangulo(){
    double la1=double.tryParse(_lado1)??0;
    double la2=double.tryParse(_lado2)??0;
    double la3=double.tryParse(_lado3)??0;

    /*Verificar si los lados forman un triángulo válido*/
    if (la1 + la2 > la3 && la1 + la3 > la2 && la2 + la3 > la1) {
      setState(() {
        _tipoTriangulo='Los lados deben ser mayores a cero y formar un triangulo';
      });

      /*Verificar tipo de triángulo*/
      if (la1 == la2 && la2 == la3) {
        setState(() {
          _tipoTriangulo = 'Triángulo Equilátero';
        });
      } else if (la1 == la2 || la1 == la3 || la2 == la3) {
        setState(() {
          _tipoTriangulo = 'Triángulo Isósceles';
        });
      } else {
        setState(() {
          _tipoTriangulo = 'Triángulo Escaleno';
        });
      }
    } else {
      setState(() {
        _tipoTriangulo = 'No es un triángulo válido';
      });
    }
  }

  /*DISEÑO*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Triangulo Bellaco'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Cada de texto LADO1
          TextField(
            onChanged: (value){
              _lado1=value;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Ingrese el Lado 1'),
          ),

          //Cada de texto LADO2
          TextField(
            onChanged: (value){
              _lado2=value;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Ingrese el Lado 2'),
          ),

          //Cada de texto LADO3
          TextField(
            onChanged: (value){
              _lado3=value;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Ingrese el Lado 1'),
          ),

          SizedBox(height: 20),
          ElevatedButton(onPressed: verificarTriangulo, child: Text('Verificar')),

          //Tamaño de la caja de texto
          SizedBox(height: 20,),
          Text(_tipoTriangulo, style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),




        ],
        ),
      ),


    );

  }

}