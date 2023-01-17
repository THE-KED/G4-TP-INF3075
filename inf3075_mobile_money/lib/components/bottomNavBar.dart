import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inf3075_mobile_money/models/account.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';
import 'package:inf3075_mobile_money/views/ProfileScreen.dart';

import 'package:inf3075_mobile_money/views/history.dart';
import 'package:inf3075_mobile_money/views/homePage.dart';
import 'package:inf3075_mobile_money/views/operation.dart';

import 'package:inf3075_mobile_money/views/settings.dart';

import '../models/client.dart';

class BottomNavBar extends StatefulWidget {
  final int select;
  Account user;

  BottomNavBar({super.key, required this.select, required this.user});

  @override
  State<StatefulWidget> createState() {
    return BottomNavBarState(user);
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  Account user;
  BottomNavBarState(this.user);

  fetchData() async {
    var response = await http.get(
      Uri.parse(
          "http://192.168.12.169:8080/Account/num?num=${user.client.phoneNber}&"),
    );

    if (response.statusCode == 400 || response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);

      user.client = Client(
        name: responseData["nom"],
        phoneNber: responseData["numero"],
      );
      user.id = responseData["id"];
      user.balance = responseData["balance"];
      user.pin = responseData["pin"];
      user.initialDate = "${responseData["intialDate"]}";
    }
  }

  int _selectedIndex = 0;
  late final screens = [
    Operation(
      myAcc: user,
    ),
    HistoryPage(
      myAcc: user,
    ),
    Home(
      myAcc: user,
    ),
    ProfileScreen(
      myAcc: user,
    ),
    Settings(
      myAcc: user,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.select;
    return BottomAppBar(
      elevation: 0,
      color: const Color.fromARGB(129, 209, 209, 209),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButtonBar(
                    icon: Icons.currency_yen_rounded,
                    selected: _selectedIndex == 0,
                    text: "transactions",
                    onPressed: () {
                      fetchData();
                      setState(() {
                        _selectedIndex = 0;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              screens[_selectedIndex],
                        ),
                      );
                    },
                  ),
                  IconButtonBar(
                    icon: Icons.history_edu_sharp,
                    selected: _selectedIndex == 1,
                    text: "history",
                    onPressed: () {
                      fetchData();
                      setState(() {
                        _selectedIndex = 1;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              screens[_selectedIndex],
                        ),
                      );
                    },
                  ),
                  IconButtonBar(
                    icon: Icons.home_sharp,
                    selected: _selectedIndex == 2,
                    text: "home",
                    onPressed: () {
                      fetchData();
                      setState(() {
                        _selectedIndex = 2;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              screens[_selectedIndex],
                        ),
                      );
                    },
                  ),
                  IconButtonBar(
                    icon: Icons.person_outlined,
                    selected: _selectedIndex == 3,
                    text: "profile",
                    onPressed: () {
                      fetchData();
                      setState(() {
                        _selectedIndex = 3;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              screens[_selectedIndex],
                        ),
                      );
                    },
                  ),
                  IconButtonBar(
                    icon: Icons.settings_suggest_rounded,
                    selected: _selectedIndex == 4,
                    text: "settings",
                    onPressed: () {
                      fetchData();
                      setState(() {
                        _selectedIndex = 4;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              screens[_selectedIndex],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconButtonBar extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final String text;
  final Function() onPressed;

  const IconButtonBar({
    super.key,
    required this.icon,
    required this.selected,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        selected
            ? Column(
                children: [
                  SizedBox(
                    height: 48,
                    width: 50,
                    child: FloatingActionButton(
                      backgroundColor: PRIMARY_COLOR,
                      onPressed: onPressed,
                      child: IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          //shadows: [],
                          icon,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      color: PRIMARY_COLOR,
                    ),
                  ),
                ],
              )
            : IconButton(
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  size: 24,
                  color: Colors.black87,
                ),
              ),
      ],
    );
  }
}
