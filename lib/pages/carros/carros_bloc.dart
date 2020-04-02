import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/carros/carros_api.dart';
import 'package:fluttercars/pages/carros/simple_bloc.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> fetch(String tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);
      add(carros);
      return carros;
    } catch (e) {
      addError(e);
    }
  }
}
