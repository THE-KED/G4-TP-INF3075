import 'package:flutter/material.dart';

import '../components/bottomNavBar.dart';

class Historique extends StatelessWidget {
  const Historique({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(select: 1),
      appBar: AppBar(
        title: const Text("Historique page"),
      ),
      body: const Text("Historique HERE"),
    );
  }
}
