import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inf3075_mobile_money/views/fingerPrintAuth.dart';
//import 'package:flutter/services.dart';

import 'utils/themes.dart';
import 'views/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
      home: const FingerPrintAuth(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.light,
      theme: lightTheme(),
    );
  }
}
