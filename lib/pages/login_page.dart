import 'package:flutter/material.dart';
import 'package:fluttercars/widgets/app_button.dart';
import 'package:fluttercars/widgets/app_text.dart';

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
            AppText(
              'Login',
              'Digite seu LOGIN de acesso...',
              controller: _controllerLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusPassword,
            ),
            SizedBox(height: 10),
            AppText(
              'Senha',
              'Digite sua SENHA...',
              obscureText: true,
              controller: _controllerPassword,
              validator: _validatePassword,
              keyboardType: TextInputType.numberWithOptions(),
              focusNode: _focusPassword,
            ),
            SizedBox(height: 20),
            AppButton(
              'Login',
              onPressed: _onClickLogin,
            ),
          ],
        ),
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
