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
      elevation: 2,
      color: Colors.blue,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonBar(
                icon: Icons.currency_yen_rounded,
                selected: _selectedIndex == 0,
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
        ),
      ),
    );
  }
}

class IconButtonBar extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const IconButtonBar(
      {super.key,
      required this.icon,
      required this.selected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 24,
            color: selected ? Colors.white : Colors.red,
          ),
        ),
      ],
    );
  }
}
