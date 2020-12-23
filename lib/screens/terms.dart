import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:chefo/widgets/my_logo.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../const.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: MyAppBar(
        title:  translator.translate('terms'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.1,
            ),
            Center(
              child: Logo(size: size),
            ),
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    color: Colors.grey,
                    offset: Offset(1.0, 1.0), //(x,y)
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      translator.translate('terms'),
                      style: TextStyle(
                          fontSize: 20,
                          foreground: Paint()..shader = linearGradient,
                          fontFamily: 'DNT'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16),
                    child: Text(
                      translator.translate('terms_text'),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'DNT',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
