import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 759.2727272727273,
        allowFontScaling: true);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100.h,
          ),
          Column(
            children: [
              Image.asset(
                'assets/images/chef.png',
                fit: BoxFit.fitWidth,
                width: 150.w,
                height: 150.h,
              ),
              SizedBox(
                height: 24.h,
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
