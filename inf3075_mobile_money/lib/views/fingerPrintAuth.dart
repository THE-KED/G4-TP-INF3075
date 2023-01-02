import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inf3075_mobile_money/API/localAuth_API.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';
import 'package:inf3075_mobile_money/views/homePage.dart';
import 'package:inf3075_mobile_money/views/onBoarding.dart';

class FingerPrintAuth extends StatefulWidget {
  const FingerPrintAuth({super.key});

  @override
  State<FingerPrintAuth> createState() => _FingerPrintAuthState();
}

class _FingerPrintAuthState extends State<FingerPrintAuth> {
  bool userAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 300,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(57, 0, 0, 0),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: SECONDARY_COLOR,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 120,
            ),
            child: Container(
              height: 500,
              width: 300,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(57, 0, 0, 0),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 250,
                      child: Center(
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/finger1.png",
                            ),
                            userAuthenticated
                                ? const Visibility(
                                    visible: true,
                                    child: Icon(
                                      Icons.check,
                                      color: PRIMARY_COLOR,
                                      size: 120,
                                    ),
                                  )
                                : const Visibility(
                                    visible: false,
                                    child: Icon(
                                      Icons.check,
                                      color: PRIMARY_COLOR,
                                      size: 120,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 250,
                      width: 300,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(57, 0, 0, 0),
                            spreadRadius: 3,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Text(
                              '\t\t\t\t\t\t\t\t\tPlease, \nPress the button to \n\t\t\t\tauthenticate',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Georgia",
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),

                          /* Container(
                            width: 200,
                            child: const TextField(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  color: Colors.green,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Colors.green,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ), */
                          const SizedBox(height: 30),
                          Container(
                            width: 260,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                                side: const BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                ),
                                backgroundColor:
                                    const Color.fromARGB(41, 88, 255, 127),
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.green,
                                ),
                              ),
                              onPressed: () async {
                                final isAuthenticated =
                                    await LocalAuthApi.authenticate();

                                if (isAuthenticated != null &&
                                    isAuthenticated) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const Onboarding(),
                                    ),
                                  );
                                  setState(() {
                                    userAuthenticated = true;
                                  });
                                }
                              },
                              child: const Text(
                                "Authentification",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
