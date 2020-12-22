import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'const.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator.builder<CustomRouter>(
        router: CustomRouter(),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffA53B46),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Montserrat',
            foreground: Paint()..shader = linearGradient,
            fontSize: 24,
          ),
          headline5: TextStyle(
            fontFamily: 'Montserrat',
            foreground: Paint()..shader = linearGradient,
            fontSize: 50,
          ),
          headline4: TextStyle(
            fontFamily: 'DNT',
            color: Colors.white,
            fontSize: 28,
          ),
          headline3: TextStyle(
            fontFamily: 'DNT',
            color: Colors.black,
            fontSize: 28,
          ),
          headline2: TextStyle(
            fontFamily: 'DNT',
            color: Colors.black,
            fontSize: 22,
          ),
          headline1: TextStyle(
            fontFamily: 'DNT',
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      title: 'Chefo',
      home: Splash(),
    );
  }
}
