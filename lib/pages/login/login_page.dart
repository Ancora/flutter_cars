import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:fluttercars/firebase.dart';
import 'package:fluttercars/pages/api_response.dart';
import 'package:fluttercars/pages/cadastro/cadastro_page.dart';
import 'package:fluttercars/pages/carros/home_page.dart';
import 'package:fluttercars/pages/login/login_bloc.dart';
import 'package:fluttercars/utils/alert.dart';
import 'package:fluttercars/utils/nav.dart';
import 'package:fluttercars/widgets/app_button.dart';
import 'package:fluttercars/widgets/app_text.dart';
import 'package:fluttercars/firebase/firebase_service.dart';
//import 'package:firebase_remote_config/firebase_remote_config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = LoginBloc();
  final _controllerLogin = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _focusPassword = FocusNode();

  @override
  void initState() {
    super.initState();

    initFcm();

    /* RemoteConfig.instance.then((remoteConfig) {
      remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: true));

      try {
        remoteConfig.fetch(expiration: const Duration(minutes: 1));
        remoteConfig.activateFetched();
      } catch (e) {
        print('Remote Config: $e');
      }
      final mensagem = remoteConfig.getString('mensagem');

      print('Mensagem remota: $mensagem');
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faça seu Login'),
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
              textAlign: TextAlign.center,
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
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            StreamBuilder<bool>(
              stream: _bloc.stream,
              initialData: false,
              builder: (context, snapshot) {
                return AppButton(
                  'Login',
                  onPressed: _onClickLogin,
                  showProgress: snapshot.data,
                );
              },
            ),
            Container(
              height: 46,
              margin: const EdgeInsets.only(top: 20),
              child: GoogleSignInButton(
                darkMode: false,
                text: ('Acesse com sua conta Google'),
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                onPressed: _onClickGoogle,
              ),
            ),
            Container(
              height: 46,
              margin: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: _onClickCadastrar,
                child: Text(
                  'Cadastre-se',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.lightBlueAccent,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onClickGoogle() async {
    final service = FirebaseService();
    ApiResponse response = await service.loginGoogle();

    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
  }

  void _onClickLogin() async {
    bool formOk = _formKey.currentState.validate();
    String login = _controllerLogin.text;
    String password = _controllerPassword.text;

    if (!formOk) {
      return;
    }

    ApiResponse response = await _bloc.login(login, password);

    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
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

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  void _onClickCadastrar() {
    push(context, CadastroPage(), replace: true);
  }
}
