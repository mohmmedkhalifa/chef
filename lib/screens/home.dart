import 'package:carousel_slider/carousel_slider.dart';
import 'package:chefo/backend/ads_provider.dart';
import 'package:chefo/backend/server.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:chefo/widgets/my_card.dart';
import 'package:chefo/widgets/my_home_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: MyAppBar(
        title: translator.translate('home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
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
            Consumer<AdsProvider>(
              builder: (context, value, child) => Container(
                height: size.height * (450 / size.height),
                child: value.allAds.length == 0
                    ? Center(
                        child: Text(translator.translate('no_ad')),
                      )
                    : GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1,
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 2,
                        ),
                        scrollDirection: Axis.vertical,
                        reverse: false,
                        itemCount: value.allAds.length,

                        itemBuilder: (context, index) {
                          return MyCard(
                            ad: value.allAds[index],
                          );
                        },
                      ),
              ),
            ),
            // HomeTitle(
            //   size: size,
            //   title: 'hotel_and_restaurant',
            // ),
            // Consumer<AdsProvider>(
            //   builder: (context, value, child) => Padding(
            //     padding: const EdgeInsets.all(8),
            //     child: Container(
            //       height: size.height,
            //       width: size.width,
            //       child: value.allAds.length == 0
            //           ? Center(
            //               child: Text(translator.translate('no_res')),
            //             )
            //           : GridView.builder(
            //               physics: NeverScrollableScrollPhysics(),
            //               padding: EdgeInsets.all(8),
            //               itemCount: value.allAds.length,
            //               itemBuilder: (context, index) {
            //                 return RestWidget(
            //                   restaurant: value.allAds[index],
            //                 );
            //               },
            //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //                 childAspectRatio: 1,
            //                 crossAxisCount: 2,
            //                 crossAxisSpacing: 12,
            //                 mainAxisSpacing: 12,
            //               ),
            //             ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
