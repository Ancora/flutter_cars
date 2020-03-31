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
      child: Center(
        child: Image.network(carro.urlFoto),
      ),
    );
  }
}
