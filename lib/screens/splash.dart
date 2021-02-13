import 'package:auto_route/auto_route.dart';
import 'package:chefo/backend/server.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/widgets/my_logo.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String userId = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = getUserId();
    if (userId != null) {
      fetchSplashData(context);
      Future.delayed(Duration(seconds: 3)).then((value) {
        ExtendedNavigator.of(context).push(Routes.home);
      });
    } else {
      Future.delayed(Duration(seconds: 3)).then((value) {
        ExtendedNavigator.of(context).push(Routes.registerIntro);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 270),
        child: Center(child: Logo(size: size)),
      ),
    );
  }
}
