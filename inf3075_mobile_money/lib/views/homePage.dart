import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';
import 'package:inf3075_mobile_money/views/History.dart';

import 'package:inf3075_mobile_money/views/reportbug.dart';

import '../components/bottomNavBar.dart';
import '../components/history_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController withdrawalAmountController = TextEditingController();
  TextEditingController withdrawalPasswordController = TextEditingController();

  String phone = "670754483";
  double currentMoney = 19200;
  int TruePassword = 20930;

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
      bottomNavigationBar: const BottomNavBar(select: 2),
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
                      phone,
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
                          "XAF  $currentMoney",
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
                                  onPressed: () {
                                    if (int.parse(withdrawalPasswordController
                                            .text) ==
                                        TruePassword) {
                                      setState(() {
                                        currentMoney = currentMoney -
                                            double.parse(
                                                withdrawalAmountController
                                                    .text);
                                      });
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
