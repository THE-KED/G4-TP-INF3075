import 'package:flutter/material.dart';


// ignore: must_be_immutable
class LogOrSign extends StatelessWidget {
  LogOrSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 120)),
            const Text(
              "Bien vouloir choisir",
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Algerian',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(bottom: 170)),
            const Text(
              "Avez-vous deja un compte ?",
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
                backgroundColor: const MaterialStatePropertyAll(Colors.blue),
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
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => ...(),//entrer la fonction voulue ou au cas contraire remplacez tout le contenu de onPressed par null
                    ));
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
              "Voulez-vous creer un compte ?",
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
                backgroundColor: const MaterialStatePropertyAll(Colors.blue),
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
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const ...(),//entrer la fonction voulue ou au cas contraire remplacez tout le contenu de onPressed par null
                    ));
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
