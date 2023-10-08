import 'package:flutter/material.dart';
import 'package:frontend/components/fire_alert.dart';
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Статистика")),
      body: const Center(child: FireNotificationWidget()),
    );
  }
}
