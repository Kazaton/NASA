import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FireNotificationWidget extends StatefulWidget {
  const FireNotificationWidget({Key? key}) : super(key: key);

  @override
  State<FireNotificationWidget> createState() => _FireNotificationWidgetState();

  void sendNotification() {}
}

class _FireNotificationWidgetState extends State<FireNotificationWidget> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> sendNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'fire_channel', 'Fire Notifications',
        priority: Priority.high);
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'ПОЖАР',
      'Пожар обнаружен в радиусе 2км от вас',
      platformChannelSpecifics,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: sendNotification,
      child: const Text("Отправить уведомление о пожаре"),
    );
  }
}
