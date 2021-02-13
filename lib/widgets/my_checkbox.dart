import 'package:flutter/material.dart';

class MyCheckBox extends StatelessWidget {
  MyCheckBox({
    Key key,
    @required this.isChecked,
    this.title,
    this.onChanged,
  }) : super(key: key);

  final bool isChecked;
  String title;
  Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: CheckboxListTile(
         activeColor: Colors.white,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline2,

          ),
          value: isChecked,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
