import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String password) async {
    var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map params = {
      "username": login,
      "password": password,
    };

    String s = jsonEncode(params);

    var response = await http.post(url, body: s, headers: headers);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = jsonDecode(response.body);
    String name = mapResponse['nome'];
    String email = mapResponse['email'];

    print('Nome: $name');
    print('E-mail: $email');

    return true;
  }
}
