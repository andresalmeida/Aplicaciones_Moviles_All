import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navegadores/Pantallas/PantallaNumeros.dart';
import 'PantallaCalificaciones.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //AGREGAR APPBAR
      appBar: AppBar(
        title: Text("Menú Principal"),
        backgroundColor: Colors.pinkAccent,
        titleTextStyle: TextStyle(fontFamily: 'CustomFont', fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              //CONEXION ENTRE PANTALLAS
              Navigator.push(context, MaterialPageRoute(builder:
                  (context)=>PantallasNu(),),);

          }, child: const Text("Número Mayor"),
          ),
            //SEPARACION ENTRE BOTONES
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              //CONEXION ENTRE PANTALLAS
              Navigator.push(context, MaterialPageRoute(builder:
                  (context)=>PantallasCa(),),);
              
          }, child: const Text("Calificaciones"),
            ),
          ],
        ),

      ),

    );

  }

}


