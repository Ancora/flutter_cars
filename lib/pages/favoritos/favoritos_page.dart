import 'package:flutter/material.dart';
import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/carros/carros_listview.dart';
import 'package:fluttercars/pages/favoritos/favoritos_bloc.dart';
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
    FavoritosBloc favoritosBloc =
        Provider.of<FavoritosBloc>(context, listen: false);
    favoritosBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    FavoritosBloc favoritosBloc = Provider.of<FavoritosBloc>(context);
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
        stream: favoritosBloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return TextError(
              'Não foi possível buscar a lista de carros!\n\nClique aqui para tentar novamente.',
              onPressed: favoritosBloc.fetch,
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
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: CarrosListView(carros),
          );
        },
      ),
    );
  }

  Future<void> _onRefresh() {
    return Provider.of<FavoritosBloc>(context).fetch();
  }
}
