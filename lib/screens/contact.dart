import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:chefo/widgets/my_button.dart';
import 'package:chefo/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:string_validator/string_validator.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  var formKey = GlobalKey<FormState>();

  String email;
  String phone;
  String description;

  saveForm() {
    bool validate = formKey.currentState.validate();
    if (validate) {
      formKey.currentState.save();
    } else {
      return;
    }
  }

  String validateEmail(String value) {
    if (value == null || value == '') {
      return 'هذا الحقل مطلوب';
    } else if (value.length < 3) {
      return 'الإيميل قصير';
    } else if (!isEmail(value)) {
      return 'صيغة خاطئة';
    }
  }

  saveEmail(String newValue) {
    email = newValue;
  }

  String validatePhone(String value) {
    if (value == null || value == '') {
      return 'هذا الحقل مطلوب';
    } else if (value.length < 10) {
      return 'رقم الهاتف قصير';
    }
  }

  savePhone(String newValue) {
    phone = newValue;
  }

  String validateDescription(String value) {
    if (value == null || value == '') {
      return 'هذا الحقل مطلوب';
    } else if (value.length < 30) {
      return 'الوصف قصير';
    }
  }

  saveDesc(String newValue) {
    description = newValue;
  }

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
            Form(
              key: formKey,
              child: Column(
                children: [
                  MyTextField(
                    validator: validateEmail,
                    onSaved: saveEmail,
                    hintText: 'البريد الإلكتروني',
                    icon: Icon(
                      FontAwesomeIcons.mailBulk,
                      size: 16,
                    ),
                  ),
                  MyTextField(
                    validator: validatePhone,
                    onSaved: savePhone,
                    hintText: 'رقم الهاتف',
                    icon: Icon(
                      FontAwesomeIcons.phone,
                      size: 16,
                    ),
                  ),
                  MyTextField(
                    validator: validateDescription,
                    onSaved: saveForm,
                    lines: 8,
                    hintText: '... يرجى كتابة مشكلتك هنا',
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  MyButton(
                    onTap: saveForm,
                    text: 'أرسل',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
