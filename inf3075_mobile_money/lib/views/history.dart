import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inf3075_mobile_money/components/bottomNavBar.dart';
import 'package:inf3075_mobile_money/models/account.dart';
import 'package:inf3075_mobile_money/models/transaction.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';

import '../components/history_model.dart';
import '../models/client.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key, required this.myAcc}) : super(key: key);

  Account myAcc;
  @override
  State<StatefulWidget> createState() {
    return _HistoryPageState(myAcc);
  }
}

class _HistoryPageState extends State<HistoryPage> {
  Account myAcc;
  _HistoryPageState(this.myAcc);

  @override
  final styleText = const TextStyle(
    fontSize: 18,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final List<HistoryModel> historyElement = [
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        select: 1,
        user: myAcc,
      ),
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: PRIMARY_COLOR,
      ),
      body: HistoryMessages(
        historyElement: historyElement,
        styleText: styleText,
        user: myAcc,
      ),
    );
  }
}

class HistoryMessages extends StatelessWidget {
  final List<HistoryModel> historyElement;
  final TextStyle styleText;
  final Account user;

  const HistoryMessages({
    Key? key,
    required this.historyElement,
    required this.styleText,
    required this.user,
  }) : super(key: key);

  Future<List<Transaction>> fetchTrans() async {
    var url = Uri.parse(
        'http://192.168.12.169:8080/Transaction/historique?num=${user.client.phoneNber}');
    final response = await http.get(url);
    // debugPrint(response.body.toString());
    // debugPrint(response.statusCode.toString());

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(
        response.body,
      );
      //  debugPrint(jsonResponse.toString());
      return jsonResponse.map((data) => Transaction.fromJson(data)).toList().reversed.toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: FutureBuilder<List<Transaction>>(
        future: fetchTrans(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {

                  return Card(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(194, 228, 233, 100),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.deepPurpleAccent,
                              ),
                              Text(
                                "Y.Money - ${snapshot.data![index].numenvoyeur}",
                                style: styleText,
                              ),
                            ],
                          ),
                          !(snapshot.data![index].montant! < 0)
                              ? Text(
                                  "You have received ${snapshot.data![index].montant?.abs()} XAF from ${snapshot.data![index].nameSend} on ${snapshot.data![index].date}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : Text(
                                  "You have sent ${snapshot.data![index].montant?.abs()} XAF to ${snapshot.data![index].nameRec} on ${snapshot.data![index].date}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            debugPrint(snapshot.toString());
            return const Center(
              child: Text(
                "Sorry, something went wrong!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text(
                "No transactions yet!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: PRIMARY_COLOR,
            ),
          );
        },
      ),
    );
  }
}
