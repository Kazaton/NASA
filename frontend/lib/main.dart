import 'package:flutter/material.dart';
import 'package:frontend/screens/homepage.dart';
import 'package:frontend/screens/faq.dart';
import 'package:frontend/screens/save/mvp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomepageScreen());
  }
}
