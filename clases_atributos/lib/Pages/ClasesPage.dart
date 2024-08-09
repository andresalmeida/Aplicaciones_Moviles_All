import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClasesPage extends StatefulWidget {
  @override
  _ClasesState createState() => _ClasesState();
}

class _ClasesState extends State<ClasesPage> {
  //INICIALIZAMOS LA CLASE
  Estudiante _estudiante = new Estudiante('Ferney', 'Gonzalez', 25);
  //Text _nombre = new Text('Ferney');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(_nombre.data);
    print(_estudiante.nombre);
    print(_estudiante.apellido);
    print(_estudiante.edad);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Clases y Objetos',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Clases y objetos'),
          ),
          body: Column(
            children: [
              Text("Nombre: ", style: TextStyle(fontSize: 25)),
              Text(_estudiante.nombre, style: TextStyle(fontSize: 25)),
              SizedBox(height: 20),
              Text("Apellido: ", style: TextStyle(fontSize: 25)),
              Text(_estudiante.apellido, style: TextStyle(fontSize: 25)),
              SizedBox(height: 20),
              Text("Edad: ", style: TextStyle(fontSize: 25)),
              Text(_estudiante.edad.toString(), style: TextStyle(fontSize: 25)),
              SizedBox(height: 20),
            ],
            //child: Text("Hola sapo 🐸", style: TextStyle(fontSize: 45),),
            //child: Text(_estudiante.nombre, style: TextStyle(fontSize: 45)),
            //child: Text(_estudiante.edad.toString(), style: TextStyle(fontSize: 45)),
          ),
        ),
      ),
    );
  }
}

class Estudiante {
  //ATRIBUTOS DE LA CLASE
  late String nombre;
  late String apellido;
  late int edad;

  //CONSTRUCTOR
  Estudiante(String nombre, String apellido, int edad) {
    this.nombre = nombre;
    this.apellido = apellido;
    this.edad = edad;
  }
  //FIN DEL CONSTRUCTOR
}
