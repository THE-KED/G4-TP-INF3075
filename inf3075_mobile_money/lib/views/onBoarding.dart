import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/views/fingerPrintAuth.dart';
import 'package:inf3075_mobile_money/views/logOrSign.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LogOrSign(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: const Text(
              'Welcome to Youth\n \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t Money',
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            child: Image.asset(

              'assets/onboard1.JPG',
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 25,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
