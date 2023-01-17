// ignore: unused_import
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/components/bottomNavBar.dart';
import 'package:inf3075_mobile_money/models/account.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';
import 'package:inf3075_mobile_money/views/loginpage.dart';

class Settings extends StatefulWidget {
  Account myAcc;
  Settings({
    Key? key,
    required this.myAcc,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsState(myAcc);
}

class _SettingsState extends State<Settings> {
  Account myAcc;
  _SettingsState(this.myAcc);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: SECONDARY_COLOR,
        bottomNavigationBar: BottomNavBar(
          select: 4,
          user: myAcc,
        ),
        body: ListView(
          children: [
            Card(
              child: ListTile(
                onTap: () {},
                selected: false,
                selectedColor: PRIMARY_COLOR,
                leading: Image.asset("assets/theme.png"),
                title: const Text("Changer Mode"),
                subtitle: const Text("theme sombre,theme clair"),
              ),
            ),
            Card(
              child: ListTile(
                selected: false,
                onTap: () {},
                selectedColor: PRIMARY_COLOR,
                leading: Image.asset("assets/phone.png"),
                title: const Text("Changer Numero"),
                subtitle:
                    const Text("veuillez changer votre numero de telephone"),
              ),
            ),
            Card(
              child: ListTile(
                selected: false,
                onTap: () {},
                selectedColor: PRIMARY_COLOR,
                leading: Image.asset("assets/langue2.png"),
                title: const Text("Changer Langue"),
                subtitle: const Text("francais,anglais,.."),
              ),
            ),
            Card(
              child: ListTile(
                selected: false,
                onTap: () {},
                leading: Image.asset("assets/help.png"),
                title: const Text("Aide"),
                subtitle: const Text("Centre d'aide, contactez nous"),
              ),
            ),
            const SizedBox(
              height: 350,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 27,
                    ),
                    label: const Text(
                      'Log out',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
