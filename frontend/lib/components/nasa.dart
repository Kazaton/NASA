import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'position.dart';

Future<void> fetchFireData() async {
  final positionHelper = PositionHelper();
  final locationData = await positionHelper.getLocation();

  if (locationData != null) {
    final response = await http.get(
      Uri.parse('https://api.nasa.gov/planetary/earth/imagery?lon=${locationData.longitude}&lat=${locationData.latitude}&api_key=ddb2bd2d4d409c7188635b1fa0b23b9d'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Обработка данных
    } else {
      throw Exception('Failed to load fire data');
    }
  } else {
    throw Exception('Location is not available');
  }
}
