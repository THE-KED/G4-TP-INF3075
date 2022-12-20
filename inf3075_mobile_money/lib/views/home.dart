import 'package:flutter/material.dart';

import '../components/bottomNavBar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: const BottomNavBar(select: 2),
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: const Text("Home HERE"),
    );
  }
}
