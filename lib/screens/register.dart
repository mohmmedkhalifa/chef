import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';

import 'package:chefo/widgets/my_circle_card.dart';
import 'package:chefo/widgets/my_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
     drawer: AppDrawer(),
      appBar: MyAppBar(
        title:'register',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * (20 / size.height),
            ),
            HeaderWidget(
              title:translator.translate('new_user_type'),
              subtitle:translator.translate('new_user_sub'),
            ),
            SizedBox(
              height: size.height * (60 / size.height),
            ),
            Column(
              children: [
                CircleCard(
                  text: 'restaurant',
                  image: 'assets/images/shop.png',
                  onTap: () {
                    ExtendedNavigator.of(context).push(
                      Routes.registerRestaurant,
                    );
                  },
                ),
                SizedBox(
                  height: size.height * (15 / size.height),
                ),
                CircleCard(
                  text:'chef',
                  image: 'assets/images/user.png',
                  onTap: () {
                    ExtendedNavigator.of(context).push(Routes.registerChef);
                  },
                ),
                SizedBox(
                  height: size.height * (16 / size.height),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
