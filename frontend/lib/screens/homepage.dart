// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(children: [
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //MAP MIRAS

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
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset('assets/fire_icon.png'),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset('assets/faq_icon.png'),
                    onPressed: () {},
                  ),
                ],
              ),
            ))
      ]),
    ]);
  }
}
