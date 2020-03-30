import 'package:flutter/material.dart';
import 'package:fluttercars/drawer_list.dart';
import 'package:fluttercars/pages/carro/carros_listview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miniatura de Carros'),
        centerTitle: true,
      ),
      body: CarrosListView(),
      drawer: DrawerList(),
    );
  }
}
