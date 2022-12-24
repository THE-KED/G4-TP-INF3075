import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/views/historique.dart';
import 'package:inf3075_mobile_money/views/home.dart';
import 'package:inf3075_mobile_money/views/operation.dart';
import 'package:inf3075_mobile_money/views/profile.dart';
import 'package:inf3075_mobile_money/views/settings.dart';

class BottomNavBar extends StatefulWidget {
  final int select;
  const BottomNavBar({super.key, required this.select});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final screens = const [
    Operation(),
    Historique(),
    Home(),
    Profile(),
    Settings(),
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
                    height: 50,
                    width: 50,
                    child: FloatingActionButton(
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
                      color: Colors.blue,
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
