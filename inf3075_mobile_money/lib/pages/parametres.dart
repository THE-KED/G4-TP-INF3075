// ignore: unused_import
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Parametres extends StatelessWidget {
  const Parametres({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  leading: Image.asset("assets/images/theme.png"),
                  title: const Text("Changer Mode"),
                  subtitle: const Text("theme sombre,theme clair"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/images/phone.png"),
                  title: const Text("Changer Numero"),
                  subtitle:
                      const Text("veuillez changer votre numero de telephone"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/images/langue2.png"),
                  title: const Text("Changer Langue"),
                  subtitle: const Text("francais,anglais,.."),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/images/help.png"),
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
