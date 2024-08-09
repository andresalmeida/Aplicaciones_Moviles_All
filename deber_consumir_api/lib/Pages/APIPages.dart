import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/Gif.dart';

class APIPages extends StatefulWidget {
  @override
  _APIPagesState createState() => _APIPagesState();
}

class _APIPagesState extends State<APIPages> {
  // Lista de GIFs
  List<Gif> _gifs = [];

  // Función para obtener los GIFs de la API
  Future<void> _getGifs() async {
    // Configurar HttpClient para ignorar verificación SSL
    HttpClient client = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    // Realizar la solicitud usando el HttpClient
    final request = await client.getUrl(Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=xGvwm5izkJ6k8sONCRZrYI7Zq10R7neB&limit=50&offset=0&rating=g&bundle=messaging_non_clips"));
    final response = await request.close();

    if (response.statusCode == 200) {
      final String responseBody = await response.transform(utf8.decoder).join();
      final jsonData = jsonDecode(responseBody);

      // Limpiar la lista antes de agregar nuevos datos
      _gifs.clear();

      // Recorrer el JSON y agregar los GIFs a la lista
      for (var item in jsonData["data"]) {
        String name = item["title"];
        String url = item["images"]["original"]["url"];
        _gifs.add(Gif(name, url));

        // Imprimir en la consola
        print('Title: $name, URL: $url');
      }
      // Actualizar el estado para reflejar los nuevos datos
      setState(() {});
    } else {
      throw Exception("ERROR DE CONEXIÓN");
    }
  }

  @override
  void initState() {
    super.initState();
    _getGifs(); // Llamar a la función para obtener los GIFs
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Consumir API Rest",
      home: Scaffold(
        appBar: AppBar(
          title: Text("AQUI LOS GIFS MOR 🤑"),
          backgroundColor: Colors.redAccent, // Color de la AppBar
        ),
        body: _gifs.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _gifs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          // Acción al hacer clic en el GIF (opcional)
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  _gifs[index].url,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _gifs[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      _gifs[index].url,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
