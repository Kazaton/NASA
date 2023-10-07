import 'package:flutter/material.dart';
import 'package:frontend/screens/save/components/fire_alert.dart';
import 'package:location/location.dart';
import 'components/position.dart';

Future<void> main() async {
  runApp(const Kazaton());
}

class Kazaton extends StatefulWidget {
  const Kazaton({super.key});

  @override
  State<Kazaton> createState() => _KazatonState();
}

class _KazatonState extends State<Kazaton> {
  final PositionHelper _positionHelper = PositionHelper();
  LocationData? _locationData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(' Example'),
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
                child: const Text('Get Location'),
              ),
              const FireNotificationWidget(),
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
