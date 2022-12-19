import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';

class VuDeTestDeThemes extends StatefulWidget {
  const VuDeTestDeThemes({super.key});

  @override
  State<VuDeTestDeThemes> createState() => _VuDeTestDeThemesState();
}

class _VuDeTestDeThemesState extends State<VuDeTestDeThemes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our themes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextButton(onPressed: () {}, child: const Text("Click me")),
            Text(
              "Onboarding page H1",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "Onboarding page H6",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              "Onboarding page body1",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Onboarding page body2",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const IconTheme(
              data: IconThemeData(color: Colors.blueGrey),
              child: Icon(Icons.add),
            ),
            const Text(
              "this is our Primary color ",
              style: TextStyle(color: PRIMARY_COLOR),
            ),
            const Text(
              "this is our Secondary color ",
              style: TextStyle(color: SECONDARY_COLOR),
            ),
            const Text("getting image from assets:"),
            Image.asset(
              "assets/onboard1.JPG",
              width: 200,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
