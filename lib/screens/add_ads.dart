import 'package:auto_route/auto_route.dart';
import 'package:chefo/backend/repository.dart';
import 'package:chefo/backend/server.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:chefo/widgets/my_button.dart';
import 'package:chefo/widgets/my_checkbox.dart';
import 'package:chefo/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

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

  saveForm() async {
    bool validate = formKey.currentState.validate();
    if (validate) {
      formKey.currentState.save();
      Map map = {
        "title": title,
        "description": description,
        "allowMail": isChecked1,
        "allowShare": isChecked2,
        "imageUrl":Repository.repository.appUser.logoUrl,
        "adOwner": Repository.repository.appUser.companyName,
        "email": Repository.repository.appUser.email,
      };
     await addNewAd(map, context).then((e)=> ExtendedNavigator.of(context).push(Routes.allAds));
    } else {
      return;
    }
  }

  String validateTitle(String value) {
    if (value == null || value == '') {
      return translator.translate('required_field');
    }
    if (value.length < 3) {
      return translator.translate('short');
    }
  }

  saveTitle(String newValue) {
    title = newValue;
  }

  String validateDescription(String value) {
    if (value == null || value == '') {
      return translator.translate('required_field');
    } else if (value.length < 20) {
      return translator.translate('short');
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
        title: 'add_ad',
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
                    hintText: translator.translate('ad_title'),
                    icon: Icon(
                      FontAwesomeIcons.user,
                      size: 16,
                    ),
                    validator: validateTitle,
                    onSaved: saveTitle,
                  ),
                  MyTextField(
                    keyboardType: TextInputType.text,
                    lines: 8,
                    hintText: translator.translate('desc'),
                    validator: validateDescription,
                    onSaved: saveDesc,
                  ),
                  MyCheckBox(
                    isChecked: isChecked1,
                    title: translator.translate('receive_msg'),
                    onChanged: (value) {
                      setState(() {
                        isChecked1 = value;
                      });
                    },
                  ),
                  MyCheckBox(
                    isChecked: isChecked2,
                    title: translator.translate('allow_repost'),
                    onChanged: (value) {
                      setState(() {
                        isChecked2 = value;
                      });
                    },
                  ),
                  MyButton(
                    text: translator.translate('add_ad'),
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
