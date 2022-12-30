import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/components/bottomNavBar.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';

class Operation extends StatefulWidget {
  const Operation({super.key});

  @override
  State<Operation> createState() => _OperationState();
}

class _OperationState extends State<Operation> {
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
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
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
                      onPressed: () {},
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
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
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
                      onPressed: () {},
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
                        Container(
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
      bottomNavigationBar: const BottomNavBar(select: 0),
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
