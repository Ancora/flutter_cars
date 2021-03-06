import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/carros/carros_model.dart';
import 'package:fluttercars/utils/nav.dart';
import 'package:fluttercars/pages/carros/carro_page.dart';
import 'package:fluttercars/widgets/text_error.dart';

class CarrosListView extends StatefulWidget {
  final String tipo;
  CarrosListView(this.tipo);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  final _model = CarrosModel();
  List<Carro> carros;
  String get tipo => widget.tipo;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() {
    _model.fetch(tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
      child: Observer(
        builder: (_) {
          List<Carro> carros = _model.carros;
          if (_model.error != null) {
            return TextError(
              'Não foi possível buscar a lista de carros!\n\nClique aqui para tentar novamente.',
              onPressed: _fetch,
            );
          }
          if (carros == null) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.lightBlueAccent,
                ),
              ),
            );
          }

          return _listView(carros);
        },
      ),
    );
  }

  Container _listView(List<Carro> carros) {
    return Container(
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
                    ButtonBarTheme(
                      data: ButtonBarThemeData(),
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('DETALHES'),
                            onPressed: () => _onClickCarro(car),
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  _onClickCarro(Carro car) {
    push(context, CarroPage(car));
  }
}
