import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'components/position.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PositionHelper _positionHelper = PositionHelper();
  LocationData? _locationData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Location Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _locationData != null
                    ? 'Location: ${_locationData!.latitude}, ${_locationData!.longitude}'
                    : 'Press the button to get location',
              ),
              ElevatedButton(
                onPressed: _getLocation,
                child: Text('Get Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getLocation() async {
    _locationData = await _positionHelper.getLocation();
    setState(() {});
  }
}
