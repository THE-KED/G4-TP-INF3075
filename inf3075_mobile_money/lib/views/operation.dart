import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/components/bottomNavBar.dart';

class Operation extends StatelessWidget {
  const Operation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Operation page"),
      ),
      body: Builder(
        builder: (context) => const Text("Operation HERE"),
      ),
      bottomNavigationBar: const BottomNavBar(select: 0),
    );
  }
}
