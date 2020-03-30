import 'package:flutter/material.dart';
import 'package:fluttercars/pages/carro/carro.dart';
import 'package:fluttercars/pages/carro/carros_api.dart';

class CarrosListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _body();
  }
}

_body() {
  Future<List<Carro>> future = CarrosApi.getCarros();

  return FutureBuilder(
    future: future,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text(
            'Não foi possível buscar a lista de carros!',
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
            ),
          ),
        );
      }
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.lightBlueAccent,
            ),
          ),
        );
      }
      List<Carro> carros = snapshot.data;
      return _listView(carros);
    },
  );
}

Container _listView(List<Carro> carros) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 0, 0, 100),
          Color.fromARGB(255, 0, 0, 150),
          Color.fromARGB(255, 0, 0, 100),
        ],
      ),
    ),
    child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
        itemBuilder: (context, index) {
          Carro car = carros[index];
          return Card(
            color: Color.fromRGBO(0, 0, 0, 0),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      car.urlFoto ??
                          'http://www.livroandroid.com.br/livro/carros/luxo/Lamborghini_Reventon.png',
                      width: 250,
                    ),
                  ),
                  Text(
                    car.nome ?? 'Sem nome',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  Text(
                    'descrição...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('DETALHES'),
                        onPressed: () {/* ... */},
                      ),
                      FlatButton(
                        child: const Text('SHARE'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
  );
}
