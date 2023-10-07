import 'dart:async';
import 'package:frontend/constants/urls.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationService {
  final int userId;
  StreamSubscription<Position>? positionStream;

  LocationService(this.userId);

  void startListening() {
    positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 5,
    )).listen((Position position) {
      _updateLocationOnServer(userId, position);
    });
  }

  Future<void> _updateLocationOnServer(int userId, Position position) async {
    final response = await http.put(
      Uri.parse('$updateUserRef$userId/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'latitude': position.latitude,
        'longitude': position.longitude,
      }),
    );

    if (response.statusCode != 200) {
      print('Failed to update location');
    }
  }

  void stopListening() {
    positionStream?.cancel();
  }
}
