import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalcularEdad extends StatelessWidget{
  //DECLARAR ATRIBUTOS
  final String nombre;
  final int anioNacimiento;
  final int mesNacimiento;
  final int diaNacimiento;

  const CalcularEdad({
    required this.nombre,
    required this.anioNacimiento,
    required this.mesNacimiento,
    required this.diaNacimiento
  });

  @override
  Widget build(BuildContext context) {
    DateTime fechaActual = DateTime.now();
    int anioActual=fechaActual.year;
    int mesActual=fechaActual.month;
    int diaActual=fechaActual.day;

    if(diaActual<diaNacimiento){
      mesActual--;
      diaActual+=31;
    }

    if(mesActual<mesNacimiento){
      anioActual--;
      mesActual+=12;
    }

    //CALCULAR
    int edadAnios=anioActual-anioNacimiento;
    int edadMeses=mesActual-mesNacimiento;
    int edadDias=diaActual-diaNacimiento;



    return Scaffold(
      appBar: AppBar(
        title: Text('Aqui se calcula su edad nea'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Su nombre: $nombre',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 20,),
            Text('Su edad nea: ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20,),
            Text('Usted tiene $edadAnios años, $edadMeses meses, y, $edadAnios días. Ya jubílese.',
            style: TextStyle(
              fontSize: 20,
            ),
            ),
          ],
        ),
      ),

    );
  }

}