import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/chef.png',
          fit: BoxFit.contain,
          width: size.width * 0.4,
          height: size.height * 0.2,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Text(
          translator.translate('title'),
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}
