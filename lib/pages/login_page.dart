import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miniaturas de Carros'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
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
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          _textFormField(
            'Login',
            'Digite seu LOGIN de acesso...',
          ),
          SizedBox(height: 10),
          _textFormField(
            'Senha',
            'Digite sua SENHA...',
            obscureText: true,
          ),
          SizedBox(height: 20),
          _button('Login'),
        ],
      ),
    );
  }

  // Métodos
  _textFormField(String label, String hint, {bool obscureText = false}) {
    return TextFormField(
      obscureText: obscureText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white70,
        fontSize: 24,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.lightBlueAccent,
          fontSize: 20,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white24,
          fontSize: 22,
        ),
      ),
    );
  }

  _button(String text) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.black.withAlpha(10),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            letterSpacing: 2,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
