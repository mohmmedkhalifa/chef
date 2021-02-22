import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/ads.dart';
import 'package:chefo/models/restaurant_model.dart';

import 'package:chefo/models/route.gr.dart';
import 'package:flutter/material.dart';


class RestWidget extends StatelessWidget {
  RestWidget({
    Key key,
    this.restaurant,

  }) : super(key: key);

  Ads restaurant;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(

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
              child: Image.network(
                restaurant.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Text(
                restaurant.adOwner,
                style: Theme.of(context).textTheme.headline2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
