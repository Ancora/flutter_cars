import 'dart:convert' as convert;
import 'dart:io';

import 'package:fluttercars/pages/api_response.dart';
import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/carros/upload_api.dart';
import 'package:fluttercars/utils/http_helper.dart' as http;

/* enum TipoCarro { CLASSICOS, ESPORTIVOS, LUXO } */
class TipoCarro {
  static final String classicos = 'classicos';
  static final String esportivos = 'esportivos';
  static final String luxo = 'luxo';
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    var url =
        'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';
    var response = await http.get(url);

    List list = convert.jsonDecode(response.body);
    List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }

  static Future<ApiResponse<bool>> save(Carro car, File file) async {
    try {
      if (file != null) {
        ApiResponse<String> response = await UploadApi.upload(file);
        if (response.ok) {
          String urlFoto = response.result;
          car.urlFoto = urlFoto;
        }
      }

      var url = 'https://carros-springboot.herokuapp.com/api/v2/carros';
      if (car.id != null) {
        url += '/${car.id}';
      }

      String json = car.toJson();
      var response = await (car.id == null
          ? http.post(url, body: json)
          : http.put(url, body: json));

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
      var url =
          'https://carros-springboot.herokuapp.com/api/v2/carros/${car.id}';

      var response = await http.delete(url);

      if (response.statusCode == 200) {
        return ApiResponse.ok(true);
      }
      return ApiResponse.error('Não foi possível excluir o carro!');
    } catch (e) {
      return ApiResponse.error('Não foi possível excluir o carro!');
    }
  }
}
