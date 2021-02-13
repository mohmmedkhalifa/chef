import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class InActive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            translator.translate('inactive'),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
          ),
        ),
      ),
    );
  }
}
