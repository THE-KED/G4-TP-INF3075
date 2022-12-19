import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("Click me"),
          ),
          Text(
            "Onboarding page H1",
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            "Onboarding page H2",
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            "Onboarding page H6",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            "Onboarding page H1",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "Onboarding page H1",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const IconTheme(
            data: IconThemeData(color: Colors.blueGrey),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
