import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FireScreen extends StatelessWidget {
  final Position? position;
  const FireScreen({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(children: <Widget>[
        Expanded(
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {},
            initialCameraPosition: CameraPosition(
              target: LatLng(position!.latitude, position!.longitude),
              zoom: 20,
            ),
          ),
        ),
      ])),
    );
  }
}
