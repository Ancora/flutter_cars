import 'dart:async';

import 'package:fluttercars/pages/api_response.dart';
import 'package:fluttercars/pages/carro/simple_bloc.dart';
import 'package:fluttercars/pages/login/login_api.dart';
import 'package:fluttercars/pages/login/usuario.dart';
 
class LoginBloc extends SimpleBloc<bool> {
  Future<ApiResponse<Usuario>> login(String login, String password) async {
    add(true);
    ApiResponse response = await LoginApi.login(login, password);
    add(false);
    return response;
  }
}