import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/ads.dart';
import 'package:chefo/models/restaurant_model.dart';

import 'package:chefo/models/route.gr.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class RestWidget extends StatelessWidget {
  RestWidget({
    Key key,
    this.restaurant,
  }) : super(key: key);

  RestaurantModel restaurant;
  List<Ads> ListOfAds;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ListOfAds =   ads
            .where((e) {
              return e.ownerId == restaurant.email;
            })
            .map((e) => e)
            .toList();

        ExtendedNavigator.of(context).push(
          Routes.restaurantDetails,
          arguments: RestaurantDetailsArguments(
            restaurant: restaurant,
            ads: ListOfAds,
          ),
        );
      },
      child: Container(
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
            Expanded(
              child: Image.asset(
                restaurant.logoUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Text(
                restaurant.userName,
                style: Theme.of(context).textTheme.headline2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
