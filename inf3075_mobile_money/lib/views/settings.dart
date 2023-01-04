// ignore: unused_import
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/components/bottomNavBar.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';

class Settings extends StatelessWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        bottomNavigationBar: const BottomNavBar(select: 4),
        body: Center(
          child: ListView(
            key: key,
            children: [
              Card(
                child: ListTile(
                  leading: Image.asset("assets/theme.png"),
                  title: const Text("Changer Mode"),
                  subtitle: const Text("theme sombre,theme clair"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/phone.png"),
                  title: const Text("Changer Numero"),
                  subtitle:
                      const Text("veuillez changer votre numero de telephone"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/langue2.png"),
                  title: const Text("Changer Langue"),
                  subtitle: const Text("francais,anglais,.."),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/help.png"),
                  title: const Text("Aide"),
                  subtitle: const Text("Centre d'aide, contactez nous"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
