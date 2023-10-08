import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/constants/urls.dart';
import 'package:frontend/screens/faq_screen.dart';
import 'package:frontend/screens/fire_screen.dart';
import 'package:frontend/screens/stats_screen.dart';
import 'package:frontend/services/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  late LocationService locationService;
  Position? currentLocation;
  int _selectedTabIndex = 0;

  late List<Widget> _tabs;

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

    setState(() {
      currentLocation = position;
      _tabs = [
        const StatsScreen(),
        FireScreen(position: currentLocation!),
        const FaqScreen(),
      ];
    });
  }

  @override
  void dispose() {
    locationService.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation == null) {
      return const CircularProgressIndicator();
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF6568A4),
        body: _tabs[_selectedTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTabIndex,
          onTap: _handleTabSelection,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              label: 'Stats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fireplace_sharp),
              label: 'Fire',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_answer),
              label: 'FAQ',
            ),
          ],
        ),
      ),
    );
  }

  void _handleTabSelection(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }
}
