import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/widgets/app_drawer.dart';
import 'package:chefo/widgets/circle_card.dart';
import 'package:chefo/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          'التسجيل',
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * (20 / 760),
            ),
            HeaderWidget(
              title: ' مستخدم جديد',
              subtitle: 'يمكنك تسجيل عضوية مجاناً',
            ),
            SizedBox(
              height: size.height * (60 / 760),
            ),
            Column(
              children: [
                CircleCard(
                  text: 'مطعم',
                  image: 'assets/images/shop.png',
                  onTap: () {
                    ExtendedNavigator.of(context)
                        .push(Routes.registerRestaurant);
                  },
                ),
                SizedBox(
                  height: size.height * (15 / 760),
                ),
                CircleCard(
                  text: 'طبّاخ',
                  image: 'assets/images/user.png',
                  onTap: () {
                    ExtendedNavigator.of(context).push(Routes.registerChef);
                  },
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


