import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/carros/simple_bloc.dart';
import 'package:fluttercars/pages/carros/carro_dao.dart';
import 'package:fluttercars/pages/favoritos/favorito_service.dart';

class FavoritosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> fetch() async {
    try {
      List<Carro> carros = await FavoritoService.getCarros();

      if (carros.isNotEmpty) {
        final dao = CarroDAO();
        carros.forEach(dao.save);
      }

      add(carros);
      return carros;
    } catch (e) {
      addError(e);
    }
  }
}