import 'package:auto_route/auto_route.dart';
import 'package:chefo/backend/repository.dart';
import 'package:chefo/backend/server.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/models/users_model.dart';
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
            accountName: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(Repository.repository.appUser.email),
            ),
            currentAccountPicture: Repository.repository.appUser.logoUrl != null
                ? CircleAvatar(
                    backgroundImage:
                        NetworkImage(Repository.repository.appUser.logoUrl),
                  )
                : CircleAvatar(
                    child: Text(Repository.repository.appUser.userName[0]
                        .toUpperCase()),
                  ),
            accountEmail: Text(Repository.repository.appUser.userName),
          ),
          ListTile(
            title: Text(
                translator.translate(
                  'switch_lang',
                ),
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: Colors.black)),
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
          MyDrawerContent(
            title: 'home',
            icon: Icon(Icons.home),
            route: Routes.home,
          ),
          MyDrawerContent(
            title: 'messages',
            icon: Icon(Icons.mail),
            route: Routes.mailBox,
          ),
          MyDrawerContent(
            title: 'add_ad',
            icon: Icon(Icons.add),
            route: Routes.addAds,
          ),
          MyDrawerContent(
            title: 'contact',
            icon: Icon(Icons.phone),
            route: Routes.contact,
          ),
          MyDrawerContent(
            title: 'terms',
            icon: Icon(Icons.menu_book),
            route: Routes.terms,
          ),
          MyDrawerContent(
            title: 'about',
            icon: Icon(Icons.info),
            route: Routes.about,
          ),
          Repository.repository.appUser.type == userType.admin
              ? MyDrawerContent(
                  title: 'control_panel',
                  icon: Icon(Icons.admin_panel_settings),
                  route: Routes.controlPanel,
                )
              : Container(),
          ListTile(
            onTap: () {
              signOut(context);
            },
            title: Text(
              translator.translate('logout'),
              style: TextStyle(fontSize: 18, fontFamily: 'DNT'),
            ),
            leading: Icon(Icons.logout),
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
            translator.translate(title),
            style: TextStyle(fontSize: 18, fontFamily: 'DNT'),
          ),
          leading: icon,
        ),
        Divider(),
      ],
    );
  }
}
