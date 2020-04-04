import 'package:flutter/material.dart';
import 'package:fluttercars/pages/carros/home_page.dart';
import 'package:fluttercars/utils/sql/db_helper.dart';
import 'package:fluttercars/pages/login/login_page.dart';
import 'package:fluttercars/pages/login/usuario.dart';
import 'package:fluttercars/utils/nav.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    /* Future.delayed(Duration(seconds: 3), () {
      push(context, LoginPage());
    }); */

    // Inicia o banco de dados
    Future futureA = DatabaseHelper.getInstance().db;
    Future futureB = Future.delayed(Duration(seconds: 3));

    Future<Usuario> futureC = Usuario.get();
    // Antes, em LoginPage():
    /* future.then((Usuario user) {
      if (user != null) {
        //Mantém o nome do usuário no campo, após reiniciar o app
        //setState(() {
        //  _controllerLogin.text = user.login;
        //});
        //Mantém o usuário conectado (login automático)
        push(context, HomePage(), replace: true);
      }
    }); */

    Future.wait([futureA, futureB, futureC]).then((List values) {
      Usuario user = values[2];
      if (user != null) {
        push(context, HomePage(), replace: true);
      } else {
        push(context, LoginPage(), replace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 0, 100),
            Color.fromARGB(255, 0, 0, 150),
            Color.fromARGB(255, 0, 0, 100),
          ],
        ),
      ),
      child: Center(
        // colocar animação do logo aqui.
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.lightBlueAccent,
          ),
        ),
      ),
    );
  }
}
