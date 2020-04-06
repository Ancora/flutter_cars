import 'dart:convert' as convert;

import 'package:fluttercars/pages/api_response.dart';
import 'package:fluttercars/pages/carros/carro.dart';
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

    List list = convert.jsonDecode(response.body);
    List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }

  static Future<ApiResponse<bool>> save(Carro car) async {
    try {
      Usuario user = await Usuario.get();

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${user.token}',
      };
      var url = 'https://carros-springboot.herokuapp.com/api/v2/carros';
      if (car.id != null) {
        url += '/${car.id}';
      }

      print('POST >> $url');

      String json = car.toJson();
      var response = await (car.id == null
          ? http.post(url, body: json, headers: headers)
          : http.put(url, body: json, headers: headers));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map mapResponse = convert.jsonDecode(response.body);
        Carro carro = Carro.fromMap(mapResponse);
        print('Novo carro: ${carro.id}');
        return ApiResponse.ok(true);
      }

      if (response.body == null || response.body.isEmpty) {
        return ApiResponse.error('Não foi possível salvar alterações!');
      }

      Map mapResponse = convert.jsonDecode(response.body);
      return ApiResponse.error(mapResponse['error']);
    } catch (e) {
      return ApiResponse.error('Não foi possível salvar alterações!');
    }
  }

  static Future<ApiResponse<bool>> delete(Carro car) async {
    try {
      Usuario user = await Usuario.get();

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${user.token}',
      };
      var url =
          'https://carros-springboot.herokuapp.com/api/v2/carros/${car.id}';

      var response = await http.delete(url, headers: headers);

      if (response.statusCode == 200) {
        return ApiResponse.ok(true);
      }
      return ApiResponse.error('Não foi possível excluir o carro!');
    } catch (e) {
      return ApiResponse.error('Não foi possível excluir o carro!');
    }
  }
}
