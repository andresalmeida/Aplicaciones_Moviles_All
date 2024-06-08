import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: "Tienes una cuenta?",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 20,
            ),
            children: [
          TextSpan(
            text: "Inicio de sesión",
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          )
        ]));
  }
}
