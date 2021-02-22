import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/ads.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({
    Key key,
    this.ad,
    this.onTap,
  }) : super(key: key);

  Ads ad;
  Function onTap;

  //392.72727272727275
  //  759.2727272727273

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ExtendedNavigator.of(context).push(
          Routes.adDetails,
          arguments: AdDetailsArguments(ad: ad),
        );
      },
      child: Card(
        elevation: 6,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  ad.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.create,
                    color: Colors.black,
                    size: 16,
                  ),
                  FittedBox(
                    child: Text(
                      ad.title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 16,
                  ),
                  FittedBox(
                    child: Text(
                      ad.adOwner,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
