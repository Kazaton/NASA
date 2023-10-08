import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
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
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20.0),
            child: const Column(
              children: [
                Center(
                  child: Text(
                    'FAQ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Dela Gothic One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '-What causes wild forest fires?',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Dela Gothic One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.0),
                  child: Text(
                    'Natural causes like lightning, as well as human activities such as campfires left unattended, discarded cigarettes, and arson.',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontFamily: 'Dela Gothic One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '-What should you do if you see a forest fire while hiking or camping?',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Dela Gothic One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.0),
                  child: Text(
                    'Do not attempt to put it out yourself. Evacuate the area immediately, mark your location, and call emergency services or local park rangers.',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontFamily: 'Dela Gothic One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '-How to call emergency if saw a fire?',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Dela Gothic One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.0),
                  child: Text(
                    'It is enough to click button.',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontFamily: 'Dela Gothic One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '-How to extinguish a small fire yourself?',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Dela Gothic One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.0),
                  child: Text(
                    '1. Use a fire extinguisher\n2. Cover the flame source with a fire extinguishing material to isolate it from oxygen.',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontFamily: 'Dela Gothic One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '-How to treat minor burns?',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Dela Gothic One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80.0),
                  child: Text(
                    'Cool the burn under cold running water for at least 10 minutes and cover with a sterile non-adhesive bandage.',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontFamily: 'Dela Gothic One',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                )
              ],
            )));
  }
}
