import 'dart:convert';

import 'package:fluttercars/pages/carro/carro.dart';
import 'package:fluttercars/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

/* enum TipoCarro { CLASSICOS, ESPORTIVOS, LUXO } */
class TipoCarro {
  static final String classicos = 'classicos';
  static final String esportivos = 'esportivos';
  static final String luxo = 'luxo';
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    Usuario user = await Usuario.get();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    };

    var url =
        'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';
    /* print('GET => $url'); */
    var response = await http.get(url, headers: headers);

    List list = jsonDecode(response.body);
    return list.map<Carro>((map) => Carro.fromJson(map)).toList();
  }
}
