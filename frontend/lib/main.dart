import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/constants/urls.dart';
import 'package:frontend/services/location.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'homepage.dart';

Future<void> main() async {
  runApp(const HomepageScreen());
  
}

class Kazaton extends StatefulWidget {
  const Kazaton({super.key});

  @override
  State<Kazaton> createState() => _KazatonState();
}

class _KazatonState extends State<Kazaton> {
  LocationData? _locationData;
  late LocationService locationService;

  Future<int> getUserId(Position position) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    int? userId = prefs.getInt('user_id');

    if (userId == null) {
      final response = await http.post(
        Uri.parse(registerRef),
        body: jsonEncode({
          'latitude': position.latitude,
          'longitude': position.longitude,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        userId = data['id'];
        await prefs.setInt('user_id', userId!);
      } else {
        throw Exception('Failed to register user.');
      }
    }

    return userId;
  }

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    Position position = await Geolocator.getCurrentPosition();
    int userId = await getUserId(position);
    locationService = LocationService(userId); 
    locationService.startListening();
  }

  @override
  void dispose() {
    locationService.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Location Example'),
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
            ],
          ),
        ),
      ),
    );
  }
}
