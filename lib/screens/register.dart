import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/widgets/circle_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatelessWidget {


  @override
  Widget build(BuildContext context) {



    return Scaffold(
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
              height: 20.h,
            ),
            ListTile(
              title: Text(
                ' مستخدم جديد',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20, fontFamily: 'DNT'),
              ),
              subtitle: Text(
                'يمكنك تسجيل عضوية مجاناً',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16, fontFamily: 'DNT'),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Column(
              children: [
                CircleCard(
                  text: 'المطاعم',
                  image: 'assets/images/shop.png',
                  onTap: () {
                    ExtendedNavigator.of(context).push(Routes.registerRestaurant);
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                CircleCard(
                  text: 'الطباخون',
                  image: 'assets/images/user.png',
                  onTap: () {
                    ExtendedNavigator.of(context).push(Routes.registerChef);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
