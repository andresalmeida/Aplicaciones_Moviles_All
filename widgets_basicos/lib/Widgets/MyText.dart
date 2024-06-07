import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const MyText({Key? key, required this.text, this.style = const TextStyle()}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
    "Hola Mundo, Bienvenidos al Recurso Tecnológico",
    style: TextStyle(color: Colors.deepPurpleAccent,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    letterSpacing: 5,
    wordSpacing: 20,
    backgroundColor: Colors.blueAccent,
      fontFamily: "Aclonica",
      decoration: TextDecoration.overline,
    ),
      textAlign: TextAlign.center,
      softWrap: true,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
