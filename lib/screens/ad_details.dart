import 'package:chefo/models/ads.dart';
import 'package:flutter/material.dart';

class AdDetails extends StatelessWidget {
  Ads ad;

  AdDetails(this.ad);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(ad.title),
    );
  }
}
