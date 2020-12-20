import 'package:flutter/material.dart';
class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    Key key,
    this.title,
    this.subtitle,
    this.trailing,
    this.leading,
  }) : super(key: key);

  String title;
  String subtitle;
  Widget trailing;
  Widget leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailing,
      leading: leading,
      title: Text(
        title,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'DNT',
        ),
      ),
      subtitle: Text(
        subtitle,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'DNT',
        ),
      ),
    );
  }
}