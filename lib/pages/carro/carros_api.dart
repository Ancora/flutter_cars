import 'dart:convert';

import 'package:fluttercars/pages/carro/carro.dart';
import 'package:http/http.dart' as http;

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros';
    print('GET => $url');
    var response = await http.get(url);

    List list = jsonDecode(response.body);

    final carros = List<Carro>();

    for (Map map in list) {
      Carro car = Carro.fromJson(map);
      carros.add(car);
    }
    return carros;
  }
}
