import 'package:chefo/widgets/app_drawer.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../const.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: MyAppBar(
        title: 'عن التطبيق',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: size.height * 0.1,
            ),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/chef.png',
                    fit: BoxFit.contain,
                    width: size.width * 0.4,
                    height: size.height * 0.2,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'الشيف',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                'عن التطبيق',
                style: TextStyle(
                    fontSize: 20,
                    foreground: Paint()..shader = linearGradient,
                    fontFamily: 'DNT'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
              child: Text(
                KAbout,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'DNT',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    FontAwesomeIcons.phoneAlt,
                    color: Theme.of(context).primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Icon(
                      FontAwesomeIcons.shareAlt,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
