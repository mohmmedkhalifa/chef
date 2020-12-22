import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/ads.dart';
import 'package:chefo/models/restaurant.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:chefo/widgets/my_background.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class RestaurantDetails extends StatelessWidget {
  List<Ads> ads;
  Restaurant restaurant;

  RestaurantDetails({this.restaurant, this.ads});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(
        title: 'تفاصيل المتجر',
      ),
      endDrawer: AppDrawer(),
      body: Stack(
        children: [
          Background(),
          SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * (250 / size.height),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(restaurant.imageUrl),
                      ),
                    ),
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
                          padding: const EdgeInsets.all(16.0),
                          child: ListTile(
                            title: Text(
                              restaurant.owner,
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            trailing: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                restaurant.imageUrl,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          tileColor: Colors.grey,
                          title: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 16.0, top: 8),
                            child: Text(
                              'إعلانات المطعم',
                              style: Theme.of(context).textTheme.headline2,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          width: double.infinity,
                          height: size.height * (200 / size.height),
                          child: ListView.builder(
                            itemCount: ads.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    ),
                                    trailing: Icon(
                                      Icons.circle,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      ads[index].title,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                      textAlign: TextAlign.end,
                                    ),
                                    onTap: () {
                                      ExtendedNavigator.of(context).push(
                                        Routes.adDetails,
                                        arguments: AdDetailsArguments(
                                          ad: ads[index],
                                        ),
                                      );
                                    },
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
