import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';

import '../components/bottomNavBar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String name = "Johny Peter";

  String ID = "UT300";

  double money = 19200;

  int password = 20200;

  _showFormDialogue(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (parem) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: nameController,
                    maxLength: 255,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: name,
                      labelText: 'Name',
                    ),
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: passwordController,
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: "$password",
                      labelText: 'password',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    password = int.parse(passwordController.text);
                    name = nameController.text;
                  });
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
            title: const Text('Edit informations'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigh = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(155, 255, 255, 255),
                PRIMARY_COLOR,
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          bottomNavigationBar: const BottomNavBar(select: 3),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 38),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'My\nProfile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Nisebuschgardens'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: heigh * 0.4,
                  child: LayoutBuilder(builder: (context, constraints) {
                    double innerHeight = constraints.maxHeight;
                    double innerWidth = constraints.maxWidth;
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: innerHeight * 0.65,
                            width: innerWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  name,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(39, 105, 171, 1),
                                    fontFamily: 'Numito',
                                    fontSize: 32,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Id",
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontFamily: 'Numito',
                                              fontSize: 21),
                                        ),
                                        Text(
                                          ID,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  39, 105, 171, 1),
                                              fontFamily: 'Numito',
                                              fontSize: 21),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 8),
                                      child: Container(
                                        height: 40,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Current Money",
                                          style: TextStyle(
                                              color: Colors.grey[900],
                                              fontFamily: 'Numito',
                                              fontSize: 21),
                                        ),
                                        Text(
                                          "$money XFA",
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  39, 105, 171, 1),
                                              fontFamily: 'Numito',
                                              fontSize: 21),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              //  width: innerWidth * 0.3,

                              child: const Icon(
                                Icons.account_circle_rounded,
                                size: 100,
                                color: SECONDARY_COLOR,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: heigh * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "My Credentials",
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 25,
                              fontFamily: "Numito",
                            ),
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "name",
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontFamily: 'Numito',
                                        fontSize: 21),
                                  ),
                                  Text(
                                    name,
                                    style: const TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Numito',
                                        fontSize: 21),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "password",
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontFamily: 'Numito',
                                        fontSize: 21),
                                  ),
                                  const Text(
                                    "******",
                                    style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Numito',
                                        fontSize: 21),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                )
              ]),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: heigh,
            onPressed: () {
              _showFormDialogue(context);
            },
            child: const Icon(Icons.edit),
          ),
        )
      ],
    );
  }
}
