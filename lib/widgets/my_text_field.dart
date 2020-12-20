import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key key,
    this.hintText,
    this.icon,
    this.prefix,
    this.lines,
  }) : super(key: key);

  String hintText;
  Widget icon;
  Widget prefix;
  int lines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        maxLines: lines,
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: hintText,
          suffixIcon: icon,
          prefix: prefix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
