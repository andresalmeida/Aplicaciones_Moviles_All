import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import '../Models/Gif.dart';
import '../config.dart'; // Importar el archivo de configuración

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

class MarvelAPI extends StatefulWidget {
  @override
  _MarvelAPIState createState() => _MarvelAPIState();
}

class _MarvelAPIState extends State<MarvelAPI> {
  List<Gif> _gifs = [];

  Future<void> _getGifs() async {
    final int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final String hash = generateMd5('$timestamp$privateKey$publicKey');

    final url =
        'https://gateway.marvel.com/v1/public/events?ts=$timestamp&apikey=$publicKey&hash=$hash&limit=50';

    HttpClient client = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == 200) {
      final String responseBody = await response.transform(utf8.decoder).join();
      final jsonData = jsonDecode(responseBody);

      _gifs.clear();

      for (var item in jsonData["data"]["results"]) {
        String name = item["name"] ??
            item["title"]; // Usar "name" o "title" según el recurso
        String url =
            item["thumbnail"]["path"] + "." + item["thumbnail"]["extension"];
        _gifs.add(Gif(name, url));

        print('Name: $name, URL: $url');
      }

      setState(() {});
    } else {
      throw Exception("ERROR DE CONEXIÓN: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personajes de Marvel",
      theme: ThemeData(
        primaryColor: Colors.red,
        secondaryHeaderColor: Colors.white,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("🎬 PERSONAJES DE MARVEL 🎬",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: _gifs.isEmpty
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Número de columnas en el grid
                  crossAxisSpacing: 10.0, // Espacio horizontal entre elementos
                  mainAxisSpacing: 10.0, // Espacio vertical entre elementos
                  childAspectRatio:
                      0.7, // Relación de aspecto de los elementos (ancho/alto)
                ),
                itemCount: _gifs.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      color: Colors.white, // Color de fondo del contenedor
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              child: Image.network(
                                _gifs[index].url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _gifs[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black, // Color del texto
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
