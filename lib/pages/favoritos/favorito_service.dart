import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/carros/carro_dao.dart';
import 'package:fluttercars/pages/favoritos/favorito.dart';
import 'package:fluttercars/pages/favoritos/favorito_dao.dart';

class FavoritoService {
  static favoritar(Carro car) async {
    // Salvar em favorito:
    // Opção 1
    /* Favorito fav = Favorito();
    fav.id = car.id;
    fav.nome = car.nome; */
    // Opção 2 (necessário alterar no construtor em favorito.dart)
    Favorito fav = Favorito.fromCarro(car);
    final dao = FavoritoDAO();
    final exists = await dao.exists(car.id);

    if (exists) {
      dao.delete(car.id);
    } else {
      dao.save(fav);
    }
  }

  static Future<List<Carro>> getCarros() async {
    List<Carro> carros = await CarroDAO()
        .query('select * from carro car, favorito fav where car.id = fav.id');
    return carros;
  }
}
