import 'package:fluttercars/utils/sql/entity.dart';
import 'package:fluttercars/pages/carros/carro.dart';

class Favorito extends Entity {
  int id;
  String nome;

  Favorito.fromCarro(Carro car) {
    id = car.id;
    nome = car.nome;
  }

  Favorito.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  @override // indica que o método foi subscrito
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    return data;
  }
}
