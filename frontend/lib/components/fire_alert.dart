// fire_alert.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FireAlert extends StatefulWidget {
  const FireAlert({super.key});

  @override
  State<FireAlert> createState() => _FireAlertState();
}

class _FireAlertState extends State<FireAlert> {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  String? _message = 'Ожидание уведомлений...';

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
    _setFirebaseListeners();
  }

  _initializeFirebase() async {
    await Firebase.initializeApp();
    await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void _simulateNotification() {
    setState(() {
      _message = 'Имитация уведомления о пожаре: Пожар обнаружен в вашем районе!';
    });
  }

  _setFirebaseListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _message = message.notification?.body ?? 'Received an empty notification.';
      });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      setState(() {
        _message = message.notification?.body ?? 'Clicked on an empty notification.';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            _message!,
            style: const TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          child: Text('Имитировать уведомление'),
          onPressed: _simulateNotification,
        ),
      ],
    );
  }
}
