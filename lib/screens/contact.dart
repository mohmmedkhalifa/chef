import 'package:auto_route/auto_route.dart';
import 'package:chefo/widgets/app_drawer.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_button.dart';
import 'package:chefo/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: MyAppBar(
        title: 'اتصل بنا',

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            MyTextField(
              hintText: 'البريد الإلكتروني',
              icon: Icon(
                FontAwesomeIcons.mailBulk,
                size: 16,
              ),
            ),
            MyTextField(
              hintText: 'رقم الهاتف',
              icon: Icon(
                FontAwesomeIcons.phone,
                size: 16,
              ),
            ),
            MyTextField(
              lines: 8,
              hintText: '... يرجى كتابة مشكلتك هنا',
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            MyButton(
              text: 'أرسل',
            )
          ],
        ),
      ),
    );
  }
}
