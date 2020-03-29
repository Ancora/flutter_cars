class Usuario {
  String login;
  String name;
  String email;
  String token;

  List<String> roles;

  Usuario.fromJson(Map<String, dynamic> map)
      : login = map['login'],
        name = map['nome'],
        email = map['email'],
        token = map['token'];

  @override
  String toString() {
    return 'Usuario(login: $login, nome: $name, email: $email, token: $token, roles: roles)';
  }
}
