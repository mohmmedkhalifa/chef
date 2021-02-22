import 'package:chefo/backend/server.dart';
import 'package:chefo/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ErrorLogin extends StatelessWidget {
  const ErrorLogin({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/login.png',
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
        SizedBox(
          height: size.height * 0.03,
        ),
        Text(
          translator.translate('inactive'),
          style: Theme.of(context).textTheme.headline6,
        ),
        MyButton(
          text: 'logout',
          onTap: () {
            signOut(context);
          },
        )
      ],
    );
  }
}
