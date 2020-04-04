import 'package:fluttercars/utils/sql/entity.dart';

class Favorito extends Entity {
  int id;
  String nome;

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
