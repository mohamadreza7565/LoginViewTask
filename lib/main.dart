import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loginuitask/res/MaterialColors.dart';
import 'package:loginuitask/res/Strings.dart';

import 'login/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Strings.fontFamily,
        primarySwatch: MaterialColors.primaryColor,
      ),
      home: const LoginPage(),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("fa", "IR"),
          Locale('ar', 'AE')
        ],
        locale: const Locale("fa", "IR")
    );
  }

}
