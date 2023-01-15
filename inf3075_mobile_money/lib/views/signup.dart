// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/components/progressLoader.dart';
import 'package:inf3075_mobile_money/models/account.dart';
import 'package:inf3075_mobile_money/models/client.dart';
import 'package:inf3075_mobile_money/services/auth_services/loginServices.dart';
import 'package:inf3075_mobile_money/views/homePage.dart';
import 'package:inf3075_mobile_money/views/loginpage.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import '../utils/themes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  int phone = 670754483;
  int password = 20200;

  //connexion to the backend

  Account? myAccount;
  bool isApiCallProcess = false;

  Future<void> register() async {
    if (passwordController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      log("hi");
      debugPrint("Debuging here");
      log("fhi");
      var response = await http.post(
          Uri.parse("http://192.168.125.169:8080/Account/save"),
          body: jsonEncode(
            {
              "idClient": "",
              "balance": "0.0",
              "pin": passwordController.text,
              "numero": phoneController.text,
              "nom": nameController.text,
              "id": "",
            },
          ),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
      log("hi2");
      debugPrint(response.body);
      if (response.statusCode == 200 || response.statusCode == 400) {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
          (Route<dynamic> route) => false,
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red.withOpacity(0.4),
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
          backgroundColor: Colors.red.withOpacity(0.4),
          elevation: 2,
          duration: const Duration(seconds: 3),
          content: const Center(
            child: Text(
              "Sorry, Empty fields not permitted",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    myAccount = Account(
      client: Client(name: "", phoneNber: ""),
      pin: "",
      balance: 0.0,
      initialDate: "${DateTime.now()}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProgressLoader(
      isAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: registerUI(context),
    );
  }

  Widget registerUI(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            //Action text(Heading)
            const Text(
              'Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 34,
              ),
            ),

            const SizedBox(height: 20),

            //Names and surnames
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(151, 238, 172, 74),
                  border: Border.all(
                    color: const Color.fromARGB(246, 255, 136, 0),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'full name',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            //Phone number
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      fontSize: 18,
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'PIN Code',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            //Password confirmation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Confirm Pin ',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 80),

            //confirmation Button

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: () {
                    register();
                    /* 
                    myAccount!.setClient = Client(
                      name: nameController.text,
                      phoneNber: phoneController.text,
                    );
                    
                    print('ok');
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      print('ok');
                      myAccount!.setPin = passwordController.text;
                      print(myAccount!.toJson());
                      //  LoginServices().registerAccount(account, context);
                    }
                    setState(() {
                      isApiCallProcess = true;
                    });
                    LoginServices apiLogin = LoginServices();
                    apiLogin.registerAccount(myAccount!).then((value) => {
                          setState(() {
                            isApiCallProcess = false; 
                          }),
                          if (value.token.isNotEmpty)
                            {
                              showModalBottomSheet(
                                backgroundColor: Colors.green,
                                context: context,
                                builder: (context) => const SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: Text(
                                      'Your credentials have been added successfully',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            }
                          else
                            {
                              showModalBottomSheet(
                                backgroundColor: Colors.red,
                                context: context,
                                builder: (context) => const SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: Text(
                                      'Sorry, wrong credentials',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            }
                        }); */
                  },
                  child: const Center(
                    child: Text(
                      'Register',
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

            const SizedBox(height: 10),

            //Already a member? Signin now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Text(
                      'I have an Account ! ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 10, 13, 230),
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        //fontWeight: FontWeight.bold
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
