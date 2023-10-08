import 'package:flutter/material.dart';

class FireScreen extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //карта с возгоранием МИРАС
    ]);
  }
}
