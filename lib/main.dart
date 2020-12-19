import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'const.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: Size(392.72727272727275, 759.2727272727273),
      allowFontScaling: false,
      child: MaterialApp(
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
          ),
        ),
        title: 'Chefo',
        home: Splash(),
      ),
    );
  }
}
