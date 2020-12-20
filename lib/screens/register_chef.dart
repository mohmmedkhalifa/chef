import 'package:chefo/widgets/app_drawer.dart';
import 'package:chefo/widgets/header_widget.dart';
import 'package:chefo/widgets/my_button.dart';
import 'package:chefo/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterChef extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          'تسجيل طبّاخ',
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              trailing: Image.asset('assets/images/user.png'),
              title: 'تسجيل طبّاخ جديد',
              subtitle: 'يمكن تسجيل طبّاخ جديد من هنا',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            MyTextField(
              hintText: 'اسم الطبّاخ',
              icon: Icon(
                FontAwesomeIcons.user,
                size: 18,
              ),
            ),
            MyTextField(
              hintText: 'البريد الإلكتروني',
              icon: Icon(
                FontAwesomeIcons.mailBulk,
                size: 16,
              ),
            ),
            MyTextField(
              hintText: 'كلمة المرور',
              icon: Icon(
                FontAwesomeIcons.key,
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
              hintText: '... يرجى كتابة مهاراتك هنا',
            ),
            MyButton(
              text: 'تسجيل',
            )
          ],
        ),
      ),
    );
  }
}
