import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Datos de Contacto',
      home: DatosContactoPage(),
    );
  }
}

class DatosContactoPage extends StatefulWidget {
  @override
  _DatosContactoPageState createState() => _DatosContactoPageState();
}

class _DatosContactoPageState extends State<DatosContactoPage> {
  // CREACION DE LISTA DE VALORES
  List<Personas> listaPersonas = [
    Personas("Ferney", "Gonzalez", "+123456789", "Pichincha", "Quito"),
    Personas("Juan", "Perez", "+987654321", "Medellín", "Antioquia"),
    Personas("Maria", "Lopez", "+456789123", "Guayas", "Daule"),
    Personas("Fernando", "Villa", "+101234567", "Los Ríos", "Los Ríos"),
    Personas("Susana", "Cornetto", "+123456789", "Ibarra", "Ibarra"),
    Personas("Chicken", "Little", "+987654321", "Medellín", "Poblado"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de Contacto'),
      ),
      body: ListView.builder(
        itemCount: listaPersonas.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: ListTile(
              onTap: () {
                mostrar(context, listaPersonas[index]);
              },
              title: Text(listaPersonas[index].nombre +
                  ' ' +
                  listaPersonas[index].apellido),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listaPersonas[index].telefono),
                  Text(
                      '${listaPersonas[index].ciudad}, ${listaPersonas[index].provincia}'),
                ],
              ),
              leading: CircleAvatar(
                child: Text(listaPersonas[index].nombre[0]),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  borrar(context, listaPersonas[index], index);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // FUNCION PARA MOSTRAR DETALLES
  void mostrar(BuildContext context, Personas persona) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Detalles de Contacto'),
        content: Text(
            'Nombre: ${persona.nombre} ${persona.apellido}\nTeléfono: ${persona.telefono}\nCiudad: ${persona.ciudad}\nProvincia: ${persona.provincia}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  // FUNCION PARA BORRAR CONTACTO
  void borrar(BuildContext context, Personas persona, int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Eliminar contacto'),
        content: Text(
            '¿Estás seguro de eliminar a ${persona.nombre} ${persona.apellido}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                listaPersonas.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

// CREACION DE CLASE PERSONAS
class Personas {
  String nombre;
  String apellido;
  String telefono;
  String ciudad;
  String provincia;

  // CONSTRUCTOR
  Personas(
      this.nombre, this.apellido, this.telefono, this.ciudad, this.provincia);
}
