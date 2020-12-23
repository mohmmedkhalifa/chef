import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    Key key,
    this.title,
    this.subtitle,
    this.trailing,
    this.leading,
    this.onTap,
  }) : super(key: key);

  String title;
  String subtitle;
  Widget trailing;
  Widget leading;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: onTap,
        trailing: leading,
        leading: trailing,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'DNT',
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'DNT',
          ),
        ),
      ),
    );
  }
}
