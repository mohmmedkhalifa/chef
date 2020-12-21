import 'package:chefo/models/restaurant.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class RestWidget extends StatelessWidget {
  RestWidget({
    Key key,
    this.restaurant,
  }) : super(key: key);

  Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              restaurant.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Text(
              restaurant.owner,
              style: Theme.of(context).textTheme.headline2,
            ),
          )
        ],
      ),
    );
  }
}