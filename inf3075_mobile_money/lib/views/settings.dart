import 'package:flutter/material.dart';

import '../components/bottomNavBar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(select: 4),
      appBar: AppBar(
        title: const Text("Settings page"),
      ),
      body: const Text("SETTINGS HERE"),
    );
  }
}
