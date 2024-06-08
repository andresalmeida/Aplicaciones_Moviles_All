import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CalcularEdad.dart';

class DatosPage extends StatelessWidget{

  final TextEditingController _name= TextEditingController();
  final TextEditingController _year= TextEditingController();
  final TextEditingController _month= TextEditingController();
  final TextEditingController _day= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INGRESO DE DATOS :P"),
        backgroundColor: Colors.lightGreen,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                labelText: 'Como se llama mor?',
                icon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: _year,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'En que año nacio bb?',
                    icon: Icon(Icons.calendar_today),
                  ),
                )),
                SizedBox(height: 20,),
                Expanded(child: TextFormField(
                  controller: _month,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'En que mes nacio bb?',
                    icon: Icon(Icons.calendar_today),
                  ),
                )),
                SizedBox(height: 20,),
                Expanded(child: TextFormField(
                  controller: _day,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'En que dia nacio bb?',
                    icon: Icon(Icons.calendar_today),
                  ),
                )),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  String nombre=_name.text;
                  int anio=int.tryParse(_year.text)??0;
                  int mes=int.tryParse(_month.text)??0;
                  int dia=int.tryParse(_day.text)??0;

                  Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>CalcularEdad(
                          nombre:nombre,
                          anioNacimiento:anio,
                          mesNacimiento:anio,
                          diaNacimiento:anio,
                        ))
                  );
                },
                  child: Text('Guarde esa info papi'),
                ),

              ],
            ),
          ],
        ),
      ),

    );

  }

}