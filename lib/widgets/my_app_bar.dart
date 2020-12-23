import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({
    Key key,
    this.title,
  }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        translator.currentLanguage == 'ar'
            ? IconButton(
                icon: Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                ),
                onPressed: () {
                  ExtendedNavigator.of(context).pop();
                },
              )
            : IconButton(
                icon: Icon(
                  FontAwesomeIcons.arrowRight,
                  color: Colors.white,
                ),
                onPressed: () {
                  ExtendedNavigator.of(context).pop();
                },
              ),
      ],
      title: Text(
        title,
        style:
            Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
