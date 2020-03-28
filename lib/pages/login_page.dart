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
          TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 24,
            ),
            decoration: InputDecoration(
              labelText: 'Login',
              labelStyle: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 20,
              ),
              hintText: 'Digite seu login de acesso...',
              hintStyle: TextStyle(color: Colors.white24),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 24,
            ),
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              labelStyle: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 20,
              ),
              hintText: 'Digite sua senha...',
              hintStyle: TextStyle(color: Colors.white24),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 46,
            child: RaisedButton(
              color: Colors.black.withAlpha(10),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
