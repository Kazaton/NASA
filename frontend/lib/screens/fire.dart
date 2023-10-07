// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class FireScreen extends StatelessWidget {
  const FireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFF6568A4),
      body: SingleChildScrollView(
        child: Column(children: [Contains()]),
      ),
    ));
  }
}

class Contains extends StatelessWidget {
  const Contains({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //карта с возгоранием МИРАС
    ]);
  }
}
