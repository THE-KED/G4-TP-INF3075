import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';
import 'package:inf3075_mobile_money/views/homePage.dart';
import 'package:inf3075_mobile_money/views/loginpage.dart';
import 'package:inf3075_mobile_money/views/signup.dart';

// ignore: must_be_immutable
class LogOrSign extends StatelessWidget {
  LogOrSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 120)),
            const Text(
              "Please, choose below",
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Algerian',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(bottom: 70)),
            const Text(
              "Do you have an account ?",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                backgroundColor: const MaterialStatePropertyAll(PRIMARY_COLOR),
                shadowColor: const MaterialStatePropertyAll(PRIMARY_COLOR),
                fixedSize: const MaterialStatePropertyAll(Size(320, 100)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                elevation: MaterialStateProperty.all(15),
                side: const MaterialStatePropertyAll(
                    BorderSide(color: Colors.white, width: 2)),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 170)),
            const Text(
              "Do you want to create an account ?",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
                backgroundColor: const MaterialStatePropertyAll(PRIMARY_COLOR),
                shadowColor: const MaterialStatePropertyAll(Colors.blue),
                fixedSize: const MaterialStatePropertyAll(Size(320, 100)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                elevation: MaterialStateProperty.all(15),
                side: const MaterialStatePropertyAll(
                    BorderSide(color: Colors.white, width: 2)),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  ),
                );
              },
              child: const Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
