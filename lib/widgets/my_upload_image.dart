import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UploadImage extends StatelessWidget {
  UploadImage({
    Key key,
    this.text,
    this.onTap,
    this.imgUrl ,
  }) : super(key: key);
  Function onTap;
  String text;
  String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.white,
      trailing:imgUrl != null ?Image.network(imgUrl) : null,
      title: Text(
        text,
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
