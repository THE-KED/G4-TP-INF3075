import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';

import '../components/bottomNavBar.dart';
import 'historique.dart';
import 'operation.dart';

String phone = "670754483";
double currentMoney = 19200;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {},
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
      body: Column(
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
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: "Make a transaction",
                      ),
                      Tab(
                        text: "transaction history",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                  width: 100,
                  child: TabBarView(
                    children: [
                      Center(
                        child: TransactionViews(),
                      ),
                      Center(
                        child: HistoryView(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
