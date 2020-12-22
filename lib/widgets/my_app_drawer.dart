import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/screens/add_ads.dart';
import 'package:chefo/screens/terms.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
            child: ListTile(
              onTap: () {
                ExtendedNavigator.of(context).push(Routes.about);
                ExtendedNavigator.of(context).pop();
              },
              title: Text(
                'حول التطبيق',
                style: TextStyle(fontSize: 18, fontFamily: 'DNT'),
                textAlign: TextAlign.end,
              ),
              leading: Icon(FontAwesomeIcons.arrowAltCircleLeft),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
            child: ListTile(
              onTap: () {
                ExtendedNavigator.of(context).push(Routes.contact);
                ExtendedNavigator.of(context).pop();
              },
              title: Text(
                'اتصل بنا',
                style: TextStyle(fontSize: 18, fontFamily: 'DNT'),
                textAlign: TextAlign.end,
              ),
              leading: Icon(FontAwesomeIcons.arrowAltCircleLeft),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddAds(),
                ));
              },
              title: Text(
                'إضافة إعلان',
                style: TextStyle(fontSize: 18, fontFamily: 'DNT'),
                textAlign: TextAlign.end,
              ),
              leading: Icon(FontAwesomeIcons.plus),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Terms(),
                ));
              },
              title: Text(
                'الشروط والأحكام',
                style: TextStyle(fontSize: 18, fontFamily: 'DNT'),
                textAlign: TextAlign.end,
              ),
              leading: Icon(FontAwesomeIcons.plus),
            ),
          ),
        ],
      ),
    );
  }
}
