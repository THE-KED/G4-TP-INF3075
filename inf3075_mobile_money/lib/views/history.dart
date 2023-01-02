import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/components/bottomNavBar.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';

import '../components/history_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  final styleText = const TextStyle(
    fontSize: 20,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

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
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(
        select: 1,
      ),
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: PRIMARY_COLOR,
      ),
      body:
          HistoryMessages(historyElement: historyElement, styleText: styleText),
    );
  }
}

class HistoryMessages extends StatelessWidget {
  const HistoryMessages({
    Key? key,
    required this.historyElement,
    required this.styleText,
  }) : super(key: key);

  final List<HistoryModel> historyElement;
  final TextStyle styleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(194, 228, 233, 100),
              ),
              child: Expanded(
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
                          historyElement[index].sendersNumbers,
                          style: styleText,
                        ),
                      ],
                    ),
                    Text(
                      historyElement[index].message,
                      style: styleText,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: historyElement.length,
      ),
    );
  }
}
