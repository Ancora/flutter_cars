import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _controllerLogin = TextEditingController();
  final _controllerPassword = TextEditingController();

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
    return Form(
      key: _formKey,
      child: Container(
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
              controller: _controllerLogin,
              validator: _validateLogin,
            ),
            SizedBox(height: 10),
            _textFormField(
              'Senha',
              'Digite sua SENHA...',
              obscureText: true,
              controller: _controllerPassword,
              validator: _validatePassword,
            ),
            SizedBox(height: 20),
            _button('Login', _onClickLogin),
          ],
        ),
      ),
    );
  }

  // Métodos
  _textFormField(
    String label,
    String hint, {
    bool obscureText = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
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

  _button(String text, Function onPressed) {
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
        onPressed: onPressed,
      ),
    );
  }

  void _onClickLogin() {
    bool formOk = _formKey.currentState.validate();
    String login = _controllerLogin.text;
    String password = _controllerPassword.text;

    if (!formOk) {
      return;
    }

    print('$login');
    print('$password');
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return 'Campo LOGIN obrigatório!';
    } else {
      return null;
    }
  }

  String _validatePassword(String text) {
    if (text.isEmpty) {
      return 'Campo SENHA obrigatório!';
    } else if (text.length < 6) {
      return 'Campo SENHA deve ter, no mínimo, 6 caracteres!';
    } else {
      return null;
    }
  }
}
