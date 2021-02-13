import 'package:flutter/material.dart';

import '../const.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key key,
    this.hintText,
    this.icon,
    this.prefix,
    this.lines,
    this.keyboardType,
    this.onSaved,
    this.validator,
    this.isSecure = false,
  }) : super(key: key);

  String hintText;
  Widget icon;
  Widget prefix;
  int lines;
  Function validator;
  Function onSaved;
  TextInputType keyboardType;
  bool isSecure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        cursorColor: Colors.black,
        maxLines: lines,
        keyboardType: keyboardType,
        textAlign: TextAlign.start,
        validator: (value) => validator(value),
        onSaved: (newValue) => onSaved(newValue),
        obscureText: isSecure,

        decoration: InputDecoration(

          filled: true,
          fillColor: Colors.white,
          alignLabelWithHint: true,
          labelText: hintText,
          hintStyle: hintStyle,
          prefixIcon: icon,
          suffix: prefix,
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
