import 'package:auto_route/auto_route.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: ListTile(
              title: Text(
                  translator.translate(
                    'switch_lang',
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: Colors.white)),
              trailing: Switch(

                value: check,
                onChanged: (value) {
                  check = value;
                  setState(() {});
                  translator.setNewLanguage(
                    context,
                    newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                    remember: true,
                    restart: true,

                  );
                },
              ),
            ),
          ),
          MyDrawerContent(
            title: translator.translate('home'),
            icon: Icon(Icons.home),
            route: Routes.home,
          ),
          MyDrawerContent(
            title: translator.translate('messages'),
            icon: Icon(Icons.mail),
            route: Routes.mailBox,
          ),
          MyDrawerContent(
            title: translator.translate('new_rest_register'),
            icon: Icon(Icons.store),
            route: Routes.registerRestaurant,
          ),
          MyDrawerContent(
            title: translator.translate('new_chef_register'),
            icon: Icon(Icons.person),
            route: Routes.registerChef,
          ),
          MyDrawerContent(
            title: translator.translate('add_ad'),
            icon: Icon(Icons.add),
            route: Routes.addAds,
          ),
          MyDrawerContent(
            title: translator.translate('contact'),
            icon: Icon(Icons.phone),
            route: Routes.contact,
          ),
          MyDrawerContent(
            title:  translator.translate('terms'),
            icon: Icon(Icons.menu_book),
            route: Routes.terms,
          ),
          MyDrawerContent(
            title:  translator.translate('about'),
            icon: Icon(Icons.info),
            route: Routes.about,
          ),
        ],
      ),
    );
  }
}

class MyDrawerContent extends StatelessWidget {
  MyDrawerContent({
    Key key,
    this.title,
    this.icon,
    this.route,
  }) : super(key: key);

  String title;
  Widget icon;
  Object route;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            ExtendedNavigator.of(context).push(route);
            ExtendedNavigator.of(context).pop();
          },
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontFamily: 'DNT'),
          ),
          leading: icon,
        ),
        Divider(),
      ],
    );
  }
}
