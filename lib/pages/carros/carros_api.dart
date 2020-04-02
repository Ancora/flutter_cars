import 'dart:convert';

import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/favoritos/carro_dao.dart';
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
    var response = await http.get(url, headers: headers);
    print(url);

    List list = jsonDecode(response.body);
    List<Carro> carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();

    final dao = CarroDAO();
    // Salvando todos os carros:
    /* for (Carro car in carros) {
      dao.save(car);
    } OU */
    /* carros.forEach((car) => dao.save(car)); OU */
    carros.forEach(dao.save);

    return carros;
  }
}
