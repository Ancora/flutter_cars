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
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Text(
            'Login',
            style: TextStyle(color: Colors.lightBlueAccent),
          ),
          TextFormField(
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Senha',
            style: TextStyle(color: Colors.lightBlueAccent),
          ),
          TextFormField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
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
