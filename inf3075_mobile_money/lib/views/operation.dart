import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/components/bottomNavBar.dart';

class Operation extends StatelessWidget {
  const Operation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Operation page"),
      ),
      body: const Text("Operation HERE"),
      bottomNavigationBar: const BottomNavBar(select: 0),
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
