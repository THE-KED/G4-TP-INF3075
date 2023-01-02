import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  _showFormDialogue(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (parem) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Annuler'),
              ),
              TextButton(
                onPressed: () async {},
                child: Text("Save"),
              ),
            ],
            title: Text('Editer les informations'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'write a name', labelText: 'Name'),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'write a password',
                      labelText: 'password',
                    ),
                  ),
                ],
              ),
            ),
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 38),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      AntDesign.arrowleft,
                      color: Colors.white,
                    ),
                    Icon(
                      AntDesign.logout,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'My\nProfile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Nisebuschgardens'),
                ),
                SizedBox(
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
                                SizedBox(
                                  height: 70,
                                ),
                                Text(
                                  "Jhone Doe",
                                  style: TextStyle(
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
                                          "5FA",
                                          style: TextStyle(
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
                                          "Soldes",
                                          style: TextStyle(
                                              color: Colors.grey[900],
                                              fontFamily: 'Numito',
                                              fontSize: 21),
                                        ),
                                        Text(
                                          "500 XFA",
                                          style: TextStyle(
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

                              child: Image.asset(
                                'assets/img_profile.png',
                                width: innerWidth * 0.45,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: heigh * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "My orders",
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 25,
                              fontFamily: "Numito",
                            ),
                          ),
                          Divider(),
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
                                    "Jhone Doe",
                                    style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Numito',
                                        fontSize: 21),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
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
                                  Text(
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
            onPressed: () {
              _showFormDialogue(context);
            },
            child: Icon(Icons.edit),
          ),
        )
      ],
    );
  }
}
