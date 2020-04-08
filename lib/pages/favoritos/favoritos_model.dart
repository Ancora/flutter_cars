import 'package:flutter/material.dart';
import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/favoritos/favorito_service.dart';

class FavoritosModel extends ChangeNotifier {
  List<Carro> carros = [];

  Future<List<Carro>> getCarros() async {
    carros = await FavoritoService.getCarros();
    notifyListeners();
    return carros;
  }
}
