import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inf3075_mobile_money/components/bottomNavBar.dart';
import 'package:inf3075_mobile_money/models/account.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';

class Operation extends StatefulWidget {
  Account myAcc;
  Operation({
    super.key,
    required this.myAcc,
  });

  @override
  State<StatefulWidget> createState() => _OperationState(myAcc);
}

class _OperationState extends State<Operation> {
  Account user;

  _OperationState(this.user);

  TextEditingController depositNumberController = TextEditingController();
  TextEditingController depositAmountController = TextEditingController();
  TextEditingController depositPasswordController = TextEditingController();

  TextEditingController withdrawalAmountController = TextEditingController();
  TextEditingController withdrawalPasswordController = TextEditingController();

  @override
  void dispose() {
    depositNumberController.dispose();
    depositAmountController.dispose();
    depositPasswordController.dispose();

    withdrawalAmountController.dispose();

    withdrawalPasswordController.dispose();
    super.dispose();
  }

  Future<Object?> _depositAlert(BuildContext context) {
    return showGeneralDialog(
        transitionDuration: const Duration(milliseconds: 800),
        barrierColor: PRIMARY_COLOR.withOpacity(0.4),
        context: context,
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeIn.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              title: Row(
                children: [
                  const Text(
                    "Deposit money",
                  ),
                  const SizedBox(
                    width: 110,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    TextFormField(
                      controller: depositNumberController,
                      maxLength: 9,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      minLines: 2,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          focusColor: PRIMARY_COLOR,
                          hoverColor: PRIMARY_COLOR,
                          labelText: "Enter 09 digits number"),
                    ),
                    TextFormField(
                      controller: depositAmountController,
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
                      controller: depositPasswordController,
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
                        var responseCheck = await http.get(
                          Uri.parse(
                              "http://192.168.12.169:8080/Account/checknum?num=${depositNumberController.text}&"),
                        );
                        var bodyCheckNum = json.decode(responseCheck.body);
                        debugPrint(bodyCheckNum.toString());
                        if (bodyCheckNum.toString() == "true") {
                          var response = await http.post(
                              Uri.parse(
                                "http://192.168.12.169:8080/Transaction/trans?num1=${user.client.phoneNber}&balance=${double.parse(depositAmountController.text)}&num2=${depositNumberController.text}&Description&type=${true}",
                              ),
                              headers: {
                                "Accept": "application/json",
                                "content-type": "application/json"
                              });
                          var body = json.decode(response.body);
                          debugPrint(body.toString());
                          if (body.toString() == "false") {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.94),
                                backgroundColor: Colors.red.withOpacity(0.9),
                                duration: const Duration(seconds: 3),
                                content: const Center(
                                  child: Text(
                                    "Unable to complete, check your account.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else if (body.toString() == "true" &&
                              depositPasswordController.text == user.pin &&
                              user.client.phoneNber !=
                                  depositNumberController.text) {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.6),
                                backgroundColor: Colors.green.withOpacity(0.9),
                                duration: const Duration(seconds: 6),
                                content: Center(
                                  child: Text(
                                    "deposit of ${depositAmountController.text} to ${depositNumberController.text} completed successfully.",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.80),
                                backgroundColor: Colors.red.withOpacity(0.9),
                                duration: const Duration(seconds: 5),
                                content: const Center(
                                  child: Text(
                                    "Sorry, something went wrong. Make sure to fill all the fields, verify the numbers, and eventually Check your network",
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
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.80),
                              backgroundColor: Colors.red.withOpacity(0.9),
                              duration: const Duration(seconds: 5),
                              content: const Center(
                                child: Text(
                                  "Sorry, something went wrong. Number does not exists",
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
                        "Confirm deposit",
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
          );
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const Visibility(
            visible: false,
            child: Text(''),
          );
        });
  }

  Future<Object?> _withdrawAlert(BuildContext context) {
    return showGeneralDialog(
        transitionDuration: const Duration(milliseconds: 500),
        barrierColor: PRIMARY_COLOR.withOpacity(0.4),
        context: context,
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeIn.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              title: Row(
                children: [
                  const Text(
                    "Withdraw money",
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                height: 300,
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
                        debugPrint(user.client.phoneNber);
                        if (user.balance >
                                double.parse(withdrawalAmountController.text) &&
                            user.pin == withdrawalPasswordController.text) {
                          var response = await http.post(
                              Uri.parse(
                                "http://192.168.12.169:8080/Transaction/trans?num1=${user.client.phoneNber}&balance=${-double.parse(withdrawalAmountController.text)}&num2=${user.client.phoneNber}&Description&type=${true}",
                              ),
                              headers: {
                                "Accept": "application/json",
                                "content-type": "application/json"
                              });
                          var body = json.decode(response.body);
                          debugPrint(body.toString());
                          if (body.toString() == "false") {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.94),
                                backgroundColor: Colors.red.withOpacity(0.9),
                                duration: const Duration(seconds: 3),
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
                              withdrawalPasswordController.text == user.pin) {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.85),
                                backgroundColor: Colors.green.withOpacity(0.9),
                                duration: const Duration(seconds: 3),
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
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.84),
                                backgroundColor: Colors.yellow.withOpacity(0.9),
                                duration: const Duration(seconds: 3),
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
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.84),
                              backgroundColor: Colors.red.withOpacity(0.9),
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
          );
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const Visibility(
            visible: false,
            child: Text(''),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 255, 254),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.18,
                left: MediaQuery.of(context).size.height * 0.07,
                right: MediaQuery.of(context).size.height * 0.07,
              ),
              child: const Text(
                "Make a transaction,\n\t\tSend or Withdraw \n\t\t\t\t\t\t\t\t\t\t\tmoney.",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Center(
              child: DottedBorder(
                color: Colors.black.withOpacity(0.4),
                radius: const Radius.circular(
                  10,
                ),
                strokeWidth: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          width: 280,
                          child: TransactionButton(
                            name: "Withdraw",
                            navigate: _withdrawAlert,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: 300,
                        ),
                        SizedBox(
                          height: 80,
                          width: 280,
                          child: TransactionButton(
                            name: "Deposit",
                            navigate: _depositAlert,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        select: 0,
        user: user,
      ),
    );
  }
}

class TransactionButton extends StatelessWidget {
  final String name;
  final Function navigate;
  const TransactionButton({
    Key? key,
    required this.name,
    required this.navigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        backgroundColor: PRIMARY_COLOR,
      ),
      onPressed: () {
        navigate(context);
      },
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 29,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}

class TransactionViews extends StatefulWidget {
  const TransactionViews({super.key});

  @override
  State<TransactionViews> createState() => _TransactionViewsState();
}

class _TransactionViewsState extends State<TransactionViews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('TRANSACTION VIEW,'),
    );
  }
}

class Withdrawal extends StatefulWidget {
  const Withdrawal({super.key});

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Widthdraw here nigga'),
    );
  }
}

class Deposit extends StatelessWidget {
  const Deposit({super.key});
  void navigateDeposit(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Deposit(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: const Text('Deposit here dude nigga'),
        ),
      ],
    );
  }
}
