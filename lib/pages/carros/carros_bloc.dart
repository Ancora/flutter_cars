import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/carros/carros_api.dart';
import 'package:fluttercars/pages/carros/simple_bloc.dart';
import 'package:fluttercars/pages/favoritos/carro_dao.dart';
import 'package:fluttercars/utils/network.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> fetch(String tipo) async {
    try {
      bool networkOn = await isNetworkOn();
      if (!networkOn) {
        // Busca no banco de dados local
        List<Carro> carros = await CarroDAO().findAllByTipo(tipo);
        add(carros);
        return carros;
      }

      List<Carro> carros = await CarrosApi.getCarros(tipo);

      if (carros.isNotEmpty) {
        final dao = CarroDAO();
        // Salvando todos os carros:
        /* for (Carro car in carros) {
          dao.save(car);
        } OU */
        /* carros.forEach((car) => dao.save(car)); OU */
        carros.forEach(dao.save);
      }

      add(carros);
      return carros;
    } catch (e) {
      addError(e);
    }
  }
}
