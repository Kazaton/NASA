import 'package:flutter/material.dart';
import 'package:frontend/services/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'components/position.dart'; // Импортируем класс PositionHelper

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFF6568A4),
      body: Contains(),
    ));
  }
}

class Contains extends StatefulWidget {
  const Contains({super.key});

  @override
  _ContainsState createState() => _ContainsState();
}

class _ContainsState extends State<Contains> {
  GoogleMapController? _controller;
  PositionHelper _positionHelper = PositionHelper();
  LatLng _center = LatLng(51, 70);

  @override
  void initState() {
    super.initState();
    _initDefaultLocation();
  }

  void _initDefaultLocation() async {
    LocationData? locationData = await _positionHelper.getLocation();
    if (locationData != null) {
      setState(() {
        _center = LatLng(locationData.latitude!, locationData.longitude!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // Google Map as background
        GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14,
          ),
        ),
        // Bottom Bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: screenWidth,
            height: 65,
            decoration: BoxDecoration(color: Color(0xFF332C2C)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Image.asset('assets/stats_icon.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StatsScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/fire_icon.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FireScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/faq_icon.png'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FAQScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Статистика")),
      body: Center(child: Text("Экран статистики")),
    );
  }
}

class FireScreen extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Пожар")),
      body: Center(child: Text("Экран пожара")),
    );
  }
}

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQ")),
      body: Center(child: Text("Экран FAQ")),
    );
  }
}
