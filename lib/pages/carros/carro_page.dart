import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercars/pages/carros/carro.dart';
import 'package:fluttercars/pages/carros/carro_form_page.dart';
import 'package:fluttercars/pages/carros/loripsum_api.dart';
import 'package:fluttercars/utils/nav.dart';
import 'package:fluttercars/widgets/text.dart';
import 'package:fluttercars/pages/favoritos/favorito_service.dart';

class CarroPage extends StatefulWidget {
  final Carro carro;
  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final _loripsumApiBloc = LoripsumBloc();
  Icon icon = Icon(Icons.favorite_border);
  Carro get carro => widget.carro;

  @override
  void initState() {
    super.initState();

    FavoritoService.isFavorito(carro).then((bool favorito) {
      setState(() {
        icon = favorito ? Icon(Icons.favorite) : Icon(Icons.favorite_border);
      });
    });

    _loripsumApiBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            color: Colors.lightBlueAccent,
            /* onSelected: (String value) => _onClickPopupMenu(value),  OU */
            onSelected: _onClickPopupMenu,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'Editar',
                  child: Text('Editar'),
                ),
                PopupMenuItem(
                  value: 'Deletar',
                  child: Text('Deletar'),
                ),
                PopupMenuItem(
                  value: 'Share',
                  child: Text('Share'),
                ),
              ];
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
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
      child: ListView(
        children: <Widget>[
          CachedNetworkImage(
              imageUrl: widget.carro.urlFoto ??
                  "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png"),
          _bloco1(),
          Divider(color: Colors.lightBlueAccent),
          _bloco2(),
        ],
      ),
    );
  }

  Row _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(widget.carro.nome, fontSize: 20, bold: true),
            text(widget.carro.tipo),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: icon,
              color: Colors.red,
              iconSize: 36,
              onPressed: _onClickFavorito,
            ),
            IconButton(
              icon: Icon(Icons.share),
              color: Colors.lightBlueAccent,
              iconSize: 36,
              onPressed: _onClickShare,
            ),
          ],
        ),
      ],
    );
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(widget.carro.descricao, fontSize: 18, bold: true),
        SizedBox(
          height: 20,
        ),
        StreamBuilder<String>(
          stream: _loripsumApiBloc.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.lightBlueAccent,
                  ),
                ),
              );
            }
            return text(snapshot.data, fontSize: 18);
          },
        ),
      ],
    );
  }

  void _onClickMapa() {}

  void _onClickVideo() {}

  _onClickPopupMenu(String value) {
    switch (value) {
      case 'Editar':
        push(context, CarroFormPage(carro: carro));
        break;
      case 'Deletar':
        print('Deletar!!!');
        break;
      case 'Share':
        print('Share!!!');
        break;
      default:
    }
  }

  void _onClickFavorito() async {
    bool favorito = await FavoritoService.favoritar(carro);

    setState(() {
      icon = favorito ? Icon(Icons.favorite) : Icon(Icons.favorite_border);
    });
  }

  void _onClickShare() {}

  @override
  void dispose() {
    super.dispose();
    _loripsumApiBloc.dispose();
  }
}
