import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BienvenidoPage.dart';

class LoginPage extends StatefulWidget{
  @override
State<LoginPage> createState()=> LoginPageState();


}

class LoginPageState extends State<LoginPage>{
  //DECLARAR LOS TEXTEDITINGCONTROLER (INSERCION DE TEXTO)
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
  return Scaffold(

    body: Container(

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purpleAccent, Colors.white]
        )
      ),

    //appBar: AppBar(
      //title: Text('Login'),
      //backgroundColor: Colors.amberAccent,
    //),
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //CAJA DE TEXTO PARA USUARIO
            TextField(
              controller: _username,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person)
              ),
            ),
            SizedBox(height: 20,),
            //CAJA DE TEXTO PARA CONTRASEÑA
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.block)
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed:(){
                  _login(context);
                },
              child: Text('Iniciar Sesión'),
            )
          ],
        ),
      ),
    ),
  )
  );
  }
  //FUNCION
  void _login(BuildContext context){
    String username = _username.text;
    String password = _password.text;

    //VERIFICAR USUARIO Y PASSWORD
    if(username == 'andres' && password == 'admin'){
      //PASAR EL PARAMETRO DE NOMBRE DE USUARIO Y PASSWORD A PAGINA DE BIENVENIDA
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => BienvenidoPage(username: username),
        ),
      );
    } else {
      //SI USUARIO Y CONTRASEÑA NO SON VALIDAS
      showDialog(context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Esa constraseña no vale papi, repita'),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('OKIIII'),)
            ],
          ));
    }



}











}