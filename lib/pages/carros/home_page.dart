import 'package:flutter/material.dart';
import 'package:fluttercars/drawer_list.dart';
import 'package:fluttercars/pages/carros/carro_form_page.dart';
import 'package:fluttercars/pages/carros/carros_api.dart';
import 'package:fluttercars/pages/carros/carros_page.dart';
import 'package:fluttercars/utils/nav.dart';
import 'package:fluttercars/utils/prefs.dart';
import 'package:fluttercars/pages/favoritos/favoritos_page.dart';

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

    _initTabs();
  }

  _initTabs() async {
    int tabIdx = await Prefs.getInt('tabIdx');

    _tabController = TabController(length: 4, vsync: this);

    setState(() {
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
        bottom: _tabController == null
            ? null
            : TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Clássicos',
                    icon: Icon(Icons.directions_car),
                  ),
                  Tab(
                    text: 'Esportivos',
                    icon: Icon(Icons.directions_car),
                  ),
                  Tab(
                    text: 'Luxo',
                    icon: Icon(Icons.directions_car),
                  ),
                  Tab(
                    text: 'Favoritos',
                    icon: Icon(Icons.favorite),
                  ),
                ],
              ),
      ),
      body: _tabController == null
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.lightBlueAccent,
                ),
              ),
            )
          : TabBarView(
              controller: _tabController,
              children: [
                CarrosPage(TipoCarro.classicos),
                CarrosPage(TipoCarro.esportivos),
                CarrosPage(TipoCarro.luxo),
                FavoritosPage(),
              ],
            ),
      drawer: DrawerList(),
      floatingActionButton: FloatingActionButton(
        /* rgb(13,71,161)
        rgb(76,175,80) */
        backgroundColor: Color.fromRGBO(76, 175, 80, 0.6),
        child: Icon(Icons.add),
        onPressed: _onClickAdicionarCarro,
      ),
    );
  }

  void _onClickAdicionarCarro() {
    push(context, CarroFormPage());
  }
}
