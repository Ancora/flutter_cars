import 'dart:async';

import 'package:fluttercars/pages/api_response.dart';
import 'package:fluttercars/pages/login/login_api.dart';
import 'package:fluttercars/pages/login/usuario.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();

  get stream => _streamController.stream;

  Future<ApiResponse<Usuario>> login(String login, String password) async {
    _streamController.add(true);
    ApiResponse response = await LoginApi.login(login, password);
    _streamController.add(false);
    return response;
  }

  void dispose() {
    _streamController.close();
  }
}
