import 'package:flutter/material.dart';
import 'package:fluttercars/drawer_list.dart';
import 'package:fluttercars/pages/carro/carros_api.dart';
import 'package:fluttercars/pages/carro/carros_listview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Miniatura de Carros'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Clássicos'),
              Tab(text: 'Esportivos'),
              Tab(text: 'Luxo'),
            ],
          ),
        ),
        body: TabBarView(children: [
          CarrosListView(TipoCarro.classicos),
          CarrosListView(TipoCarro.esportivos),
          CarrosListView(TipoCarro.luxo),
        ]),
        drawer: DrawerList(),
      ),
    );
  }
}
