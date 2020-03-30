import 'package:flutter/material.dart';
import 'package:fluttercars/drawer_list.dart';
import 'package:fluttercars/pages/carro/carros_listview.dart';

class HomePage extends StatelessWidget {
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
          CarrosListView(),
          CarrosListView(),
          CarrosListView(),
        ]),
        drawer: DrawerList(),
      ),
    );
  }
}
