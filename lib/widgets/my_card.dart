import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/ads.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCard extends StatelessWidget {
  MyCard({
    Key key,
    this.ad,
  }) : super(key: key);

  Ads ad;

  //392.72727272727275
  //  759.2727272727273

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        ExtendedNavigator.of(context).push(Routes.adDetails, arguments: ad);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              Container(
                width: size.width * (150 / 392),
                height: size.height * (150 / 760),
                child: Image.asset(
                  ad.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ListTile(
                      trailing: Icon(FontAwesomeIcons.file),
                      title: Text(
                        ad.title,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.headline1,
                        maxLines: 3,
                      ),
                    ),
                    ListTile(
                      trailing: Icon(FontAwesomeIcons.clock),
                      title: Text(
                        ad.dateTime,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.headline1,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          width: size.width * (360 / 392),
        ),
      ),
    );
  }
}
