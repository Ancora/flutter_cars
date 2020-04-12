import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttercars/firebase/firebase_service.dart';
import 'package:fluttercars/pages/carros/carro.dart';
/* import 'package:fluttercars/pages/favoritos/favorito.dart';
import 'package:fluttercars/pages/favoritos/favorito_dao.dart';
import 'package:fluttercars/pages/favoritos/favoritos_model.dart';
import 'package:provider/provider.dart'; */

class FavoritoService {
  // Salvar a collection carros dentro do document do usuário logado
  CollectionReference get _users => Firestore.instance.collection('users');
  CollectionReference get _carros =>
      _users.document(firebaseUserUid).collection('carros');

  // Salvar apenas com a collection carros
  // CollectionReference get _carros => Firestore.instance.collection('carros');
  Stream<QuerySnapshot> get stream => _carros.snapshots();

  Future<bool> favoritar(Carro car) async {
    DocumentReference docRef = _carros.document('${car.id}');
    DocumentSnapshot doc = await docRef.get();
    // Salvar em favorito:
    // Opção 1
    /* Favorito fav = Favorito();
    fav.id = car.id;
    fav.nome = car.nome; */
    // Opção 2 (necessário alterar no construtor em favorito.dart)
    /* Favorito fav = Favorito.fromCarro(car);
    final dao = FavoritoDAO(); */
    final exists = doc.exists;

    if (exists) {
      docRef.delete();
      /* dao.delete(car.id);
      Provider.of<FavoritosModel>(context, listen: false).getCarros(); */
      return false;
    } else {
      docRef.setData(car.toMap());
      /* dao.save(fav);
      Provider.of<FavoritosModel>(context, listen: false).getCarros(); */
      return true;
    }
  }

  Future<bool> isFavorito(Carro car) async {
    // final dao = FavoritoDAO();
    DocumentReference docRef = _carros.document('${car.id}');
    DocumentSnapshot doc = await docRef.get();
    final exists = doc.exists;
    return exists;
  }

  /* Future<bool> deleteCarros() async {
    print("Delete carros do usuário logado: $firebaseUserUid");

    // Deleta os carros
    final query = await _carros.getDocuments();
    for (DocumentSnapshot doc in query.documents) {
      await doc.reference.delete();
    }

    // Deleta a referencia do usuário
    _users.document(firebaseUserUid).delete();

    return true;
  } */
}
