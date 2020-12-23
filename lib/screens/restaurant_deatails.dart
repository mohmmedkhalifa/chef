import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/ads.dart';
import 'package:chefo/models/restaurant.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class RestaurantDetails extends StatelessWidget {
  List<Ads> ads;
  Restaurant restaurant;

  RestaurantDetails({this.restaurant, this.ads});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(
        title: translator.translate('restaurant_details'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

                          style: Theme.of(context).textTheme.headline2,
                        ),
                        leading: CircleAvatar(
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
                            translator.translate('rest_ads'),
                          style: Theme.of(context).textTheme.headline2,

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
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                ),
                                leading: Icon(
                                  Icons.circle,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  ads[index].title,
                                  style:
                                      Theme.of(context).textTheme.headline2,

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
    );
  }
}
