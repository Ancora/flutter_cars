import 'package:flutter/material.dart';
import 'package:fluttercars/pages/carro/carro.dart';
import 'package:fluttercars/utils/nav.dart';
import 'package:fluttercars/pages/carro/carro_page.dart';

class CarrosListView extends StatelessWidget {
  final List<Carro> carros;
  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context) {
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
                          onPressed: () => _onClickCarro(context, car),
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

  _onClickCarro(context, Carro car) {
    push(context, CarroPage(car));
  }
}
