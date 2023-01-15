import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/services/auth_services/loginServices.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';
import 'package:inf3075_mobile_money/views/homePage.dart';
import 'package:inf3075_mobile_money/views/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  int phone = 670754483;
  int password = 20200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            //Action text
            const Text(
              'Login Here',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 34,
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.12),

            //Phone number
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(151, 238, 172, 74),
                  border:
                      Border.all(color: const Color.fromARGB(246, 255, 136, 0)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    maxLength: 9,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Phone number',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            //password textfeild
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(151, 238, 172, 74),
                  border:
                      Border.all(color: const Color.fromARGB(246, 255, 136, 0)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    maxLength: 5,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'PIN CODE * * * * * *',
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.13),

            //Signin Button

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: () {
                   
                    if (int.parse(phoneController.text) == phone &&
                        int.parse(passwordController.text) == password) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      showModalBottomSheet(
                        backgroundColor: Colors.red,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: ((context) => const Text(
                              'Sorry, wrong credentials',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            )),
                      );
                    }
                  },
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),

            //Not a member? Register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: const ButtonStyle(),
                  child: const Text(
                    ' Do not have an Account? ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 10, 13, 230),
                        fontSize: 20),
                  ),
                ),
                /*TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue[800],
                        fontSize: 18,
                      ),
                    )),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
