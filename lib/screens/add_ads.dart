import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';

import 'package:chefo/widgets/my_button.dart';
import 'package:chefo/widgets/my_checkbox.dart';
import 'package:chefo/widgets/my_text_field.dart';
import 'package:chefo/widgets/my_upload_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddAds extends StatefulWidget {
  @override
  _AddAdsState createState() => _AddAdsState();
}

class _AddAdsState extends State<AddAds> {
  var formKey = GlobalKey<FormState>();

  String title;
  String imageUrl;

  String description;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  saveForm() {
    bool validate = formKey.currentState.validate();
    if (validate) {
      formKey.currentState.save();
    } else {
      return;
    }
  }

  String validateTitle(String value) {
    if (value == null || value == '') {
      return 'Required Field';
    }
    if (value.length < 3) {
      return 'Name is too short';
    }
  }

  saveTitle(String newValue) {
    title = newValue;
  }

  String validateDescription(String value) {
    if (value == null || value == '') {
      return 'Required Field';
    } else if (value.length < 50) {
      return 'Description is too short';
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
        title: 'إضافة إعلان',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * (30 / size.height),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  MyTextField(
                    keyboardType: TextInputType.name,
                    hintText: 'عنوان الإعلان',
                    icon: Icon(
                      FontAwesomeIcons.user,
                      size: 16,
                    ),
                    validator: validateTitle,
                    onSaved: saveTitle,
                  ),
                  UploadImage(
                    text: 'يرجى رفع صورة المتجر',
                  ),
                  MyTextField(
                    keyboardType: TextInputType.text,
                    lines: 8,
                    hintText: '... الوصف',
                    validator: validateDescription,
                    onSaved: saveDesc,
                  ),
                  MyCheckBox(
                    isChecked: isChecked1,
                    title: 'استقبال رسائل داخلية',
                    onChanged: (value) {
                      setState(() {
                        isChecked1 = value;
                      });
                    },
                  ),
                  MyCheckBox(
                    isChecked: isChecked2,
                    title: 'السماح بإعادة النشر',
                    onChanged: (value) {
                      setState(() {
                        isChecked2 = value;
                      });
                    },
                  ),
                  MyCheckBox(
                    isChecked: isChecked3,
                    title: 'عدم الإزعاج',
                    onChanged: (value) {
                      setState(() {
                        isChecked3 = value;
                      });
                    },
                  ),
                  MyButton(
                    text: 'إضافة إعلان',
                    onTap: saveForm,
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
