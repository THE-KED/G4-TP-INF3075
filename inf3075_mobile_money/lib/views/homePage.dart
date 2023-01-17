import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inf3075_mobile_money/models/account.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';
import 'package:inf3075_mobile_money/views/history.dart';

import 'package:inf3075_mobile_money/views/reportbug.dart';

import '../components/bottomNavBar.dart';
import '../components/history_model.dart';

class Home extends StatefulWidget {
  Account myAcc;
  Home({super.key, required this.myAcc});

  @override
  State<StatefulWidget> createState() {
    return _HomeState(myAcc);
  }
}

class _HomeState extends State<Home> {
  Account myAcc;
  _HomeState(this.myAcc);

  TextEditingController withdrawalAmountController = TextEditingController();
  TextEditingController withdrawalPasswordController = TextEditingController();

  @override
  void dispose() {
    withdrawalAmountController.dispose();
    withdrawalPasswordController.dispose();
    super.dispose();
  }

  final List<HistoryModel> historyElement = [
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"),
    HistoryModel(
        sendersNumbers: "697624477",
        message: "Le numéro xxxxxxxx vous a envoyez la somme de .....FCFA"),
  ];
  final styleText = const TextStyle(
    fontSize: 20,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ReportBug(),
                ),
              );
            },
            icon: const Icon(
              Icons.support_agent_sharp,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 150,
          ),
        ],
        elevation: 2,
        backgroundColor: PRIMARY_COLOR,
      ),
      bottomNavigationBar: BottomNavBar(
        select: 2,
        user: myAcc,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: PRIMARY_COLOR,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      myAcc.client.phoneNber!,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "XAF  ${myAcc.balance}",
                          style: const TextStyle(
                            fontSize: 27,
                            color: SECONDARY_COLOR,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    child: const TabBar(
                      labelColor: PRIMARY_COLOR,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: PRIMARY_COLOR,
                      automaticIndicatorColorAdjustment: true,
                      labelStyle: TextStyle(color: PRIMARY_COLOR),
                      tabs: [
                        Tab(
                          text: "Withdraw money",
                        ),
                        Tab(
                          text: "transaction history",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width - 50,
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Center(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: withdrawalAmountController,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 2,
                                  minLines: 2,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    focusColor: PRIMARY_COLOR,
                                    hoverColor: PRIMARY_COLOR,
                                    labelText: "Enter Amount",
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: withdrawalPasswordController,
                                  maxLength: 5,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 2,
                                  minLines: 2,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      focusColor: PRIMARY_COLOR,
                                      hoverColor: PRIMARY_COLOR,
                                      border: OutlineInputBorder(),
                                      hintText: "05 digits only",
                                      labelText: "Enter password"),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        50,
                                      ),
                                    ),
                                    backgroundColor: PRIMARY_COLOR,
                                  ),
                                  onPressed: () async {
                                    debugPrint(myAcc.client.phoneNber);
                                    if (myAcc.balance >
                                            double.parse(
                                                withdrawalAmountController
                                                    .text) &&
                                        myAcc.pin ==
                                            withdrawalPasswordController.text) {
                                      var response = await http.post(
                                          Uri.parse(
                                            "http://192.168.12.169:8080/Transaction/trans?num1=${myAcc.client.phoneNber}&balance=${-double.parse(withdrawalAmountController.text)}&num2=${myAcc.client.phoneNber}&Description&type=${true}",
                                          ),
                                          headers: {
                                            "Accept": "application/json",
                                            "content-type": "application/json"
                                          });
                                      var body = json.decode(response.body);
                                      debugPrint(body.toString());
                                      if (body.toString() == "false") {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.94),
                                            backgroundColor:
                                                Colors.red.withOpacity(0.9),
                                            duration:
                                                const Duration(seconds: 3),
                                            content: const Center(
                                              child: Text(
                                                "Unable to complete, Sorry.",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else if (body.toString() == "true" &&
                                          withdrawalPasswordController.text ==
                                              myAcc.pin) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.85),
                                            backgroundColor:
                                                Colors.green.withOpacity(0.9),
                                            duration:
                                                const Duration(seconds: 3),
                                            content: Center(
                                              child: Text(
                                                "Withdrawal of ${withdrawalAmountController.text} completed successfully.",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.84),
                                            backgroundColor:
                                                Colors.yellow.withOpacity(0.9),
                                            duration:
                                                const Duration(seconds: 3),
                                            content: const Center(
                                              child: Text(
                                                "Sorry, something went wrong. Check your network",
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
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          margin: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.84),
                                          backgroundColor:
                                              Colors.red.withOpacity(0.9),
                                          duration: const Duration(seconds: 3),
                                          content: const Center(
                                            child: Text(
                                              "Sorry, passwords do not match, insufficient funds, or empty fields provided",
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
                                  child: const Text(
                                    "Confirm Withdraw",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: HistoryMessages(
                            historyElement: historyElement,
                            styleText: styleText,
                            user: myAcc,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
