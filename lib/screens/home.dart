import 'package:carousel_slider/carousel_slider.dart';
import 'package:chefo/dummy_data.dart';
import 'package:chefo/widgets/app_drawer.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_card.dart';
import 'package:chefo/widgets/restaurant_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: MyAppBar(
        title: 'الصفحة الرئيسية',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CarouselSlider(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Text(
                'الإعلانات الحديثة',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Container(

              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? size.height * (320 / 760)
                  : size.height * (470 / 760),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Text(
                'المطبابخ والفنادق',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Container(
              height: size.height * (300 / 760),
              width: double.infinity,
              child: GridView.builder(
                padding: EdgeInsets.all(8),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return RestWidget(
                    restaurant: restaurants[index],
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
