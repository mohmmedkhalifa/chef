import 'package:auto_route/auto_route.dart';
import 'package:chefo/backend/admin_provider.dart';
import 'package:chefo/backend/chef_provider.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/screens/register_intro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import 'backend/restaurant_provider.dart';
import 'const.dart';
import 'screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/langs/',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RestaurantProvider()),
        ChangeNotifierProvider(create: (context) => ChefProvider()),
        ChangeNotifierProvider(create: (context) => AdminProvider()),
      ],
      child: LocalizedApp(
        child: MyApp(),
      ),
    ),
  );
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
      localizationsDelegates: translator.delegates,
      locale: translator.locale,
      supportedLocales: translator.locals(),
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
    );
  }
}
