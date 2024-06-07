import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard".toUpperCase()),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            text: "My",
            children: [
              TextSpan(
                text: "Aplicacion",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Movil",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}