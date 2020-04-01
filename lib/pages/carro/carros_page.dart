import 'package:flutter/material.dart';
import 'package:fluttercars/pages/carro/carro.dart';
import 'package:fluttercars/pages/carro/carros_bloc.dart';
import 'package:fluttercars/pages/carro/carros_listview.dart';
import 'package:fluttercars/widgets/text_error.dart';

class CarrosPage extends StatefulWidget {
  final String tipo;
  CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
  final _bloc = CarrosBloc();
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
    _bloc.fetch(tipo);
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
      child: StreamBuilder(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return TextError(
              'Não foi possível buscar a lista de carros!\n\nClique aqui para tentar novamente.',
              onPressed: _fetch,
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
          return CarrosListView(carros);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
