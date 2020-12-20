import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.25,
          ),
          Column(
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
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    ExtendedNavigator.of(context).push(Routes.home);
                  },
                  child: Text(
                    'تخطي',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ExtendedNavigator.of(context).push(Routes.register);
                  },
                  child: Text(
                    'تسجيل',
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
