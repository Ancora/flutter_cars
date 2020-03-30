import 'package:fluttercars/pages/carro/carro.dart';

class CarrosApi {
  static List<Carro> getCarros() {
    final carros = List<Carro>();

    carros.add(
      Carro(
          nome: 'Cadillac Convertibles 3',
          urlFoto:
              'http://www.livroandroid.com.br/livro/carros/classicos/Cadillac_Deville_Convertible.png'),
    );
    carros.add(
      Carro(
          nome: 'Chevrolet Bel-Air',
          urlFoto:
              'http://www.livroandroid.com.br/livro/carros/classicos/Chevrolet_BelAir.png'),
    );
    carros.add(
      Carro(
          nome: 'Cadillac Eldorado',
          urlFoto:
              'http://www.livroandroid.com.br/livro/carros/classicos/Cadillac_Eldorado.png'),
    );

    return carros;
  }
}
