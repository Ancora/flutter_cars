import 'dart:convert' as convert;

import 'package:fluttercars/utils/prefs.dart';

class Usuario {
  int id;
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  Usuario(
      {this.id,
      this.login,
      this.nome,
      this.email,
      this.urlFoto,
      this.token,
      this.roles});

  Usuario.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    nome = json['nome'];
    email = json['email'];
    urlFoto = json['urlFoto'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }

  static void clear() {
    Prefs.setString('user.prefs', '');
  }

  void save() {
    Map map = toMap();
    String json = convert.jsonEncode(map);
    Prefs.setString('user.prefs', json);
  }

  static Future<Usuario> get() async {
    String json = await Prefs.getString('user.prefs');
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.jsonDecode(json);
    Usuario user = Usuario.fromMap(map);
    return user;
  }

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, urlfoto: $urlFoto, token: $token, roles: $roles}';
  }
}
