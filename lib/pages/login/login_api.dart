import 'dart:convert';

import 'package:fluttercars/pages/api_response.dart';
import 'package:fluttercars/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(
      String login, String password) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v1/login';

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      Map params = {
        "username": login,
        "password": password,
      };

      String s = jsonEncode(params);
      var response = await http.post(url, body: s, headers: headers);
      Map mapResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromMap(mapResponse);
        user.save();
        return ApiResponse.ok();
      }

      return ApiResponse.error(msg: mapResponse['error']);
    } catch (error, exception) {
      print('Erro no login $error > $exception');
      return ApiResponse.error(msg: 'Não foi possível fazer o login!');
    }
  }
}
