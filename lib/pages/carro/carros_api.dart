import 'dart:convert';

import 'package:fluttercars/pages/carro/carro.dart';
import 'package:http/http.dart' as http;

/* enum TipoCarro { CLASSICOS, ESPORTIVOS, LUXO } */
class TipoCarro {
  static final String classicos = 'classicos';
  static final String esportivos = 'esportivos';
  static final String luxo = 'luxo';
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    /* String soTipo = tipo.toString().replaceAll('TipoCarro.', ''); */

    var url =
        'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo';
    print('GET => $url');
    var response = await http.get(url);

    List list = jsonDecode(response.body);

    return list.map<Carro>((map) => Carro.fromJson(map)).toList();

    /* for (Map map in list) {
      Carro car = Carro.fromJson(map);
      carros.add(car);
    }
    return carros;*/
  }
}
