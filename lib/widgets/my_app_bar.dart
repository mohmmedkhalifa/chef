import 'package:auto_route/auto_route.dart';
import 'package:chefo/screens/mail_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({
    Key key,
    this.title,
  }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.white,
        ),
        onPressed: () {
          ExtendedNavigator.of(context).pop();
        },
      ),
      title: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.facebookMessenger,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MailBox(),
              ));
            },
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
