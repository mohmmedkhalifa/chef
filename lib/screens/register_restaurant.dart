import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:chefo/widgets/my_background.dart';
import 'package:chefo/widgets/my_header_widget.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_button.dart';
import 'package:chefo/widgets/my_text_field.dart';
import 'package:chefo/widgets/my_upload_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterRestaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: MyAppBar(
        title: 'تسجيل المطاعم',
      ),
      body: Stack(
        children: [
          Background(),
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(
                  trailing: Image.asset('assets/images/shop.png'),
                  title: 'تسجيل مطعم جديد',
                  subtitle: 'يمكنك تسجيل مطعمك من هنا',
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                MyTextField(
                  hintText: 'اسم المطعم',
                  icon: Icon(
                    FontAwesomeIcons.store,
                    size: 18,
                  ),
                ),
                MyTextField(
                  hintText: 'صاحب المطعم',
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
                ListTile(
                  tileColor: Colors.white,
                  title: Text(
                    'حدد موقعك',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'DNT',
                    ),
                  ),
                  trailing: Icon(
                    Icons.location_pin,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                MyTextField(
                  hintText: 'رقم الهاتف',
                  icon: Icon(
                    FontAwesomeIcons.phone,
                    size: 16,
                  ),
                ),
                UploadImage(
                  text: 'شعار المتجر',
                ),
                MyTextField(
                  hintText: 'نشاط الشركة',
                  icon: Icon(
                    FontAwesomeIcons.phoenixFramework,
                    size: 16,
                  ),
                ),
                MyButton(
                  text: 'تسجيل',
                  onTap: () {
                    print('تسجيل');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
