import 'package:flutter/material.dart';
import 'package:fluttercars/pages/carro/carro.dart';

class CarroPage extends StatelessWidget {
  final Carro carro;
  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
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
          Image.network(carro.urlFoto),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    carro.nome,
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    carro.tipo,
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite),
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
          )
        ],
      ),
    );
  }

  void _onClickMapa() {}

  void _onClickVideo() {}

  _onClickPopupMenu(String value) {
    switch (value) {
      case 'Editar':
        print('Editar!!!');
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

  void _onClickFavorito() {}

  void _onClickShare() {}
}
