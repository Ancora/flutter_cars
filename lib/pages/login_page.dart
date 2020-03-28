import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerLogin = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _focusPassword = FocusNode();

  @override
  void initState() {
    super.initState();
  }

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
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusPassword,
            ),
            SizedBox(height: 10),
            _textFormField(
              'Senha',
              'Digite sua SENHA...',
              obscureText: true,
              controller: _controllerPassword,
              validator: _validatePassword,
              keyboardType: TextInputType.numberWithOptions(),
              focusNode: _focusPassword,
            ),
            SizedBox(height: 20),
            _button('Login', _onClickLogin),
          ],
        ),
      ),
    );
  }

  _textFormField(
    String label,
    String hint, {
    bool obscureText = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
    TextInputType keyboardType,
    TextInputAction textInputAction,
    FocusNode focusNode,
    FocusNode nextFocus,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
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
