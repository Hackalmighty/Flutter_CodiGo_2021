
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMap()
    );
  }

  Widget buildMap(){

    final cameraPosition = CameraPosition(target: LatLng(59.000000, 30.320000), zoom: 7.0);

    return GoogleMap(initialCameraPosition: cameraPosition);
  }

}
