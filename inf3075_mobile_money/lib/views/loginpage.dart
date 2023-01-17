import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/models/account.dart';
import 'package:inf3075_mobile_money/models/client.dart';
import 'package:inf3075_mobile_money/services/auth_services/loginServices.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';
import 'package:inf3075_mobile_money/views/homePage.dart';
import 'package:inf3075_mobile_money/views/signup.dart';
import 'package:http/http.dart' as http;

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
                    onPressed: () async {
                      Account user = Account(
                        client: Client(name: "", phoneNber: ""),
                        pin: "",
                        balance: 0.0,
                        initialDate: "${DateTime.now()}",
                      );
                      if (phoneController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        //check if num exists

                        var responseCheck = await http.get(
                          Uri.parse(
                              "http://192.168.12.169:8080/Account/checknum?num=${phoneController.text}&"),
                        );
                        var bodyCheckNum = json.decode(responseCheck.body);
                        debugPrint(bodyCheckNum.toString());
                        if (bodyCheckNum.toString() == "true") {
                          var response = await http.get(
                            Uri.parse(
                                "http://192.168.12.169:8080/Account/num?num=${phoneController.text}&"),
                          );

                          if (response.statusCode == 400 ||
                              response.statusCode == 200) {
                            Map<String, dynamic> responseData =
                                json.decode(response.body);

                            user.client = Client(
                              name: responseData["nom"],
                              phoneNber: responseData["numero"],
                            );
                            user.id = responseData["id"];
                            user.balance = responseData["balance"];
                            user.pin = responseData["pin"];
                            user.initialDate = "${responseData["intialDate"]}";

                            debugPrint("${response.statusCode}");
                            if (user.pin == passwordController.text) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(
                                    myAcc: user,
                                  ),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.94),
                                  backgroundColor: Colors.red.withOpacity(0.85),
                                  duration: const Duration(seconds: 3),
                                  content: Center(
                                    child: Text(
                                      "Sorry, Wrong password for: ${phoneController.text}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.94),
                                backgroundColor: Colors.red.withOpacity(0.9),
                                duration: const Duration(seconds: 3),
                                content: const Center(
                                  child: Text(
                                    "Sorry, Something went wrong",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.94),
                              backgroundColor: Colors.red.withOpacity(0.9),
                              duration: const Duration(seconds: 3),
                              content: const Center(
                                child: Text(
                                  "Sorry, Number does not exist",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.94),
                            backgroundColor: Colors.red.withOpacity(0.9),
                            duration: const Duration(seconds: 3),
                            content: const Center(
                              child: Text(
                                "Sorry, there should be no empty fields",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
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
                    )),
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
