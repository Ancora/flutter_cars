import 'package:flutter/material.dart';
import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/carros/carros_listview.dart';
import 'package:fluttercars/pages/favoritos/favoritos_model.dart';
import 'package:fluttercars/widgets/text_error.dart';
import 'package:provider/provider.dart';

class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage>
    with AutomaticKeepAliveClientMixin<FavoritosPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    FavoritosModel model = Provider.of<FavoritosModel>(context, listen: false);
    model.getCarros();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    FavoritosModel model = Provider.of<FavoritosModel>(context);
    List<Carro> carros = model.carros;
    if (carros.isEmpty) {
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
        child: TextError('Nenhum carro nos favoritos!'),
      );
    }
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
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: CarrosListView(carros),
      ),
    );
  }

  Future<void> _onRefresh() {
    return Provider.of<FavoritosModel>(context, listen: false).getCarros();
  }
}
