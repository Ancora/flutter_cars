import 'package:flutter/material.dart';
import 'package:fluttercars/drawer_list.dart';
import 'package:fluttercars/pages/carro/carros_api.dart';
import 'package:fluttercars/pages/carro/carros_listview.dart';
import 'package:fluttercars/utils/prefs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    Future<int> future = Prefs.getInt('tabIdx');

    future.then((int tabIdx) {
      _tabController.index = tabIdx;
    });

    _tabController.addListener(() {
      Prefs.setInt('tabIdx', _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miniatura de Carros'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Clássicos'),
            Tab(text: 'Esportivos'),
            Tab(text: 'Luxo'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CarrosListView(TipoCarro.classicos),
          CarrosListView(TipoCarro.esportivos),
          CarrosListView(TipoCarro.luxo),
        ],
      ),
      drawer: DrawerList(),
    );
  }
}
