import 'package:fluttercars/pages/carro/carro.dart';
import 'package:fluttercars/pages/carro/carros_api.dart';
import 'package:fluttercars/pages/carro/simple_bloc.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  fetch(String tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);
      add(carros);
    } catch (e) {
      addError(e);
    }
  }
}
