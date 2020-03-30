import 'package:flutter/material.dart';
import 'package:fluttercars/drawer_list.dart';
import 'package:fluttercars/pages/carro/caroos_api.dart';
import 'package:fluttercars/pages/carro/carro.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miniatura de Carros'),
        centerTitle: true,
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    List<Carro> carros = CarrosApi.getCarros();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 0, 100),
            Color.fromARGB(255, 0, 0, 150),
            Color.fromARGB(255, 0, 0, 100),
          ],
        ),
      ),
      child: ListView.builder(
          itemCount: carros.length,
          itemBuilder: (context, index) {
            Carro car = carros[index];
            return Row(
              children: <Widget>[
                Image.network(
                  car.urlFoto,
                  width: 200,
                ),
                Flexible(
                  child: Text(
                    car.nome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
