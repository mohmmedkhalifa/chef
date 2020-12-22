import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UploadImage extends StatelessWidget {
  UploadImage({
    Key key,
    this.text,
  }) : super(key: key);

  String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'DNT',
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Icon(
          FontAwesomeIcons.upload,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
