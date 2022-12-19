import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/themes.dart';
import 'views/onBoarding.dart';
import 'views/vuDeTestDeThemes.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    // MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile money app-INF3075',
      home: const VuDeTestDeThemes(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.light,
      theme: lightTheme(),
    );
  }
}
