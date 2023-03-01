import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loginuitask/core/client/http_client.dart';
import 'package:loginuitask/core/client/auth_api_service.dart';
import 'package:loginuitask/data/repo/auth_repo.dart';
import 'package:loginuitask/res/material_colors.dart';
import 'package:loginuitask/res/strings.dart';
import 'package:loginuitask/screen/login/login_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthRepo>(
            create: (context) => AuthRepo(AuthApiService(HttpClient.instance))),
      ],
      child: const MyApp(),
    ),
  );
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
        home: const LoginScreen(),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale("fa", "IR"), Locale('ar', 'AE')],
        locale: const Locale("fa", "IR"));
  }
}
