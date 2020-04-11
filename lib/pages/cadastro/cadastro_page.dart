import 'package:fluttercars/firebase/firebase_service.dart';
import 'package:fluttercars/pages/carros/home_page.dart';
import 'package:fluttercars/pages/login/login_page.dart';
import 'package:fluttercars/utils/alert.dart';
import 'package:fluttercars/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:fluttercars/widgets/app_text.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _tNome = TextEditingController();
  final _tEmail = TextEditingController();
  final _tSenha = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _progress = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastro"),
      ),
      body: _body(context),
      /* body: Padding(
        padding: EdgeInsets.all(16),
        child: _body(context),
      ), */
    );
  }

  _body(BuildContext context) {
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
              'Nome',
              'Digite seu NOME...',
              controller: _tNome,
              validator: _validateNome,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              /* controller: _tNome,
              validator: _validateNome,
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
              ),
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
                hintText: "Digite o seu nome",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ), */
            ),
            SizedBox(height: 20),
            AppText(
              'E-mail',
              'Digite seu E-MAIL...',
              controller: _tEmail,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            /* TextFormField(
              controller: _tEmail,
              validator: _validateLogin,
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
              ),
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
                hintText: "Digite o seu email",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ), */
            AppText(
              'Senha',
              'Digite sua SENHA...',
              controller: _tSenha,
              validator: _validateSenha,
              obscureText: true,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
            ),
            /* TextFormField(
              controller: _tSenha,
              validator: _validateSenha,
              obscureText: true,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
              ),
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
                hintText: "Digite a sua Senha",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ), */
            Container(
              height: 46,
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                color: Colors.black.withAlpha(10),
                child: _progress
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                    : Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 22,
                        ),
                      ),
                onPressed: () {
                  _onClickCadastrar(context);
                },
              ),
            ),
            Container(
              height: 46,
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                color: Colors.lightBlueAccent,
                child: Text(
                  "Cancelar",
                  style: TextStyle(
                    color: Colors.black.withAlpha(90),
                    fontSize: 22,
                  ),
                ),
                onPressed: () {
                  _onClickCancelar(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _validateNome(String text) {
    if (text.isEmpty) {
      return "Informe o nome";
    }

    return null;
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe o email";
    }

    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    if (text.length <= 2) {
      return "Senha precisa ter mais de 2 números";
    }

    return null;
  }

  _onClickCancelar(context) {
    push(context, LoginPage(), replace: true);
  }

  _onClickCadastrar(context) async {
    print("Cadastrar!");

    String nome = _tNome.text;
    String email = _tEmail.text;
    String senha = _tSenha.text;

    print("Nome $nome, Email $email, Senha $senha");

    if (!_formKey.currentState.validate()) {
      return;
    }

    setState(() {
      _progress = true;
    });

    final service = FirebaseService();
    final response = await service.cadastrar(nome, email, senha);

    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }

    setState(() {
      _progress = false;
    });
  }
}
