// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const PRIMARY_COLOR = Color.fromRGBO(245, 167, 14, 0.63);
const SECONDARY_COLOR = Colors.white;

ThemeData darkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
      brightness: Brightness.light,
      primaryColor: const Color.fromRGBO(245, 167, 14, 0.63),
      splashColor: const Color.fromARGB(255, 0, 0, 0),
      indicatorColor: const Color.fromARGB(255, 0, 0, 0),
      accentColor: const Color.fromARGB(255, 0, 0, 0),
      primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
        color: const Color.fromARGB(255, 0, 0, 0),
        size: 20,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(51, 182, 161, 1),
        ),
        headline6: TextStyle(
          fontSize: 14.0,
          fontStyle: FontStyle.italic,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        bodyText1: TextStyle(
          fontSize: 13.0,
          fontFamily: 'Georgia',
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        bodyText2: TextStyle(
          fontSize: 10.0,
          fontFamily: 'Hind',
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      cardColor: const Color.fromARGB(255, 253, 253, 253),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color.fromRGBO(40, 88, 210, 1),
        textTheme: ButtonTextTheme.normal,
        shape: RoundedRectangleBorder(),
        hoverColor: Colors.indigo,
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 255, 255, 255),
        size: 10,
        opacity: 1,
      ));
}

ThemeData lightTheme() {
  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    splashColor: const Color.fromRGBO(51, 182, 161, 1),
    brightness: Brightness.dark,
    indicatorColor: const Color.fromARGB(255, 255, 186, 10),
    primaryColor: const Color.fromRGBO(245, 167, 14, 0.63),
    accentColor: const Color.fromARGB(255, 0, 0, 0),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(51, 182, 161, 1),
      ),
      headline6: TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      bodyText1: TextStyle(
        fontSize: 13.0,
        fontFamily: 'Georgia',
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      bodyText2: TextStyle(
        fontSize: 10.0,
        fontFamily: 'Hind',
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    cardColor: const Color.fromARGB(255, 253, 253, 253),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromRGBO(40, 88, 210, 1),
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(),
      hoverColor: Colors.indigo,
    ),
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 0, 0, 0),
      size: 10,
      opacity: 1,
    ),
  );
}
