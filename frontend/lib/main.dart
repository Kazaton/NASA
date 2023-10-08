import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'components/position.dart'; // Импортируем класс PositionHelper

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  PositionHelper _positionHelper = PositionHelper(); // Создаем экземпляр PositionHelper
  LatLng _center = LatLng(51, 70);   // Изначально устанавливаем 0, 0

  @override
  void initState() {
    super.initState();
    _initDefaultLocation(); // Вызываем метод для получения изначальных координат
  }

  // Метод для получения изначальных координат из PositionHelper
  void _initDefaultLocation() async {
    LocationData? locationData = await _positionHelper.getLocation();
    if (locationData != null) {
      setState(() {
        _center = LatLng(locationData.latitude!, locationData.longitude!);
        _latitudeController.text = locationData.latitude.toString();
        _longitudeController.text = locationData.longitude.toString();
      });
    }
  }
void _updateLocation() async {
    LocationData? locationData = await _positionHelper.getLocation();
    if (locationData != null) {
      setState(() {
        _center = LatLng(locationData.latitude!, locationData.longitude!);
        _latitudeController.text = locationData.latitude.toString();
        _longitudeController.text = locationData.longitude.toString();
      });

      if (_controller != null) {
        _controller!.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: _center, zoom: 14),
          ),
        );
      }
    }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _latitudeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Latitude',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _longitudeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Longitude',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _updateLocation,
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _center, // Используем _center для изначальных координат
                zoom: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
