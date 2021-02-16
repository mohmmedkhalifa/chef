import 'package:carousel_slider/carousel_slider.dart';
import 'package:chefo/dummy_data.dart';

import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';

import 'package:chefo/widgets/my_card.dart';
import 'package:chefo/widgets/my_home_title.dart';
import 'package:chefo/widgets/my_restaurant_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: MyAppBar(
        title: translator.translate('home'),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 60),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: [
                Image.asset(
                  'assets/images/res1.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/res2.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/res3.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          HomeTitle(
            size: size,
            title: translator.translate('recent_ads'),
          ),
          Container(
            height: size.height * (320 / size.height),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemCount: ads.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: MyCard(
                    ad: ads[index],
                  ),
                );
              },
            ),
          ),
          HomeTitle(
            size: size,
            title:'hotel_and_restaurant',
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Container(
          //     height: size.height,
          //     width: size.width,
          //     child: GridView.builder(
          //       physics: NeverScrollableScrollPhysics(),
          //       padding: EdgeInsets.all(8),
          //       itemCount: restaurants.length,
          //       itemBuilder: (context, index) {
          //         return RestWidget(
          //           restaurant: restaurants[index],
          //         );
          //       },
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         childAspectRatio: 1,
          //         crossAxisCount: 2,
          //         crossAxisSpacing: 12,
          //         mainAxisSpacing: 12,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
