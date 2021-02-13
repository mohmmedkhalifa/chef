import 'package:flutter/material.dart';
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
      title: Text(
        translator.translate(title),
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
