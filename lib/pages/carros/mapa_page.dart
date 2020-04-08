import 'package:flutter/material.dart';
import 'package:fluttercars/pages/carros/carro.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatelessWidget {
  final Carro carro;
  MapaPage(this.carro);

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
      child: GoogleMap(
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: latLng(),
          zoom: 17,
        ),
        markers: Set.of(_getMarkers()),
      ),
    );
  }

  latLng() {
    return carro.latlng();
    //return LatLng(-9.6519911, -35.7197529);
  }

  List<Marker> _getMarkers() {
    return [
      Marker(
          markerId: MarkerId('1'),
          position: carro.latlng(),
          infoWindow: InfoWindow(
              title: carro.nome,
              snippet: 'Local de teste',
              onTap: () {
                print('Clicou na janela!');
              }),
          // onTap do marcador
          onTap: () {
            print('Clicou no marcador!');
          })
    ];
  }
}
