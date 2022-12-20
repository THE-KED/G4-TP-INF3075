import 'package:flutter/material.dart';

import '../components/bottomNavBar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: const BottomNavBar(select: 3),
      appBar: AppBar(
        title: const Text("Profile page"),
      ),
      body: const Text("Profile HERE"),
    );
  }
}
