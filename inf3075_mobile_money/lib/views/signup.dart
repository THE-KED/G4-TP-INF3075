import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/views/homePage.dart';
import 'package:inf3075_mobile_money/views/loginpage.dart';

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

  @override
  Widget build(BuildContext context) {
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
                  color: Color.fromARGB(151, 238, 172, 74),
                  border: Border.all(color: Color.fromARGB(246, 255, 136, 0)),
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
                  color: Color.fromARGB(151, 238, 172, 74),
                  border: Border.all(color: Color.fromARGB(246, 255, 136, 0)),
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
                  color: Color.fromARGB(151, 238, 172, 74),
                  border: Border.all(color: Color.fromARGB(246, 255, 136, 0)),
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
                  border: Border.all(color: Color.fromARGB(246, 255, 136, 0)),
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
                    showModalBottomSheet(
                      backgroundColor: Colors.green,
                      context: context,
                      builder: (context) => const Text(
                        'credentials added successfully',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                      (Route<dynamic> route) => false,
                    );
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
