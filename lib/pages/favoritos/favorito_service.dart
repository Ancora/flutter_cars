import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/carros/carro_dao.dart';
import 'package:fluttercars/pages/favoritos/favorito.dart';
import 'package:fluttercars/pages/favoritos/favorito_dao.dart';
import 'package:fluttercars/pages/favoritos/favoritos_model.dart';
import 'package:provider/provider.dart';

class FavoritoService {
  static Future<bool> favoritar(context, Carro car) async {
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
      Provider.of<FavoritosModel>(context, listen: false).getCarros();
      return false;
    } else {
      dao.save(fav);
      Provider.of<FavoritosModel>(context, listen: false).getCarros();
      return true;
    }
  }

  static Future<List<Carro>> getCarros() async {
    List<Carro> carros = await CarroDAO()
        .query('select * from carro car, favorito fav where car.id = fav.id');
    return carros;
  }

  static Future<bool> isFavorito(Carro car) async {
    final dao = FavoritoDAO();
    final exists = await dao.exists(car.id);
    return exists;
  }
}
