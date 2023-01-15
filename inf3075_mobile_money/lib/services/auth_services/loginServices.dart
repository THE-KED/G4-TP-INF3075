import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/account.dart';
import '../../views/homePage.dart';

class LoginServices {
  Future registerAccount(Account account) async {
    print("in register");
    String url = "http://localhost:8080/Account/save";
    var response = await http.post(
      Uri.parse(url),
      body: account.toJson(),
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return account.fromJson(
        json.decode(response.body),
      );
      /* showModalBottomSheet(
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
      );

      sleep(
        const Duration(seconds: 3),
      );
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
        (Route<dynamic> route) => false,
      ); */
    } else {
      throw Exception('failed to post');
      /*  showModalBottomSheet(
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
      ); */
    }
  }

  Future<Account> fetchAccounts() async {
    final response = await http
        .get(Uri.parse('http://localhost:8080/Account/num?num=670754483'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Account.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Account');
    }
  }
}
