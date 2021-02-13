import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/widgets/my_logo.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class RegisterIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.25,
          ),
          Logo(size: size),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    ExtendedNavigator.of(context).push(Routes.register);
                  },
                  child: Text(
                    translator.translate('register_button'),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ExtendedNavigator.of(context).push(Routes.login);
                  },
                  child: Text(
                    translator.translate('login'),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
