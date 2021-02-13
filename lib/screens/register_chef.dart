import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:chefo/backend/chef_provider.dart';
import 'package:chefo/backend/server.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/models/users_model.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_button.dart';
import 'package:chefo/widgets/my_checkbox.dart';
import 'package:chefo/widgets/my_header_widget.dart';
import 'package:chefo/widgets/my_text_field.dart';
import 'package:chefo/widgets/my_upload_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class RegisterChef extends StatefulWidget {
  @override
  _RegisterChefState createState() => _RegisterChefState();
}

class _RegisterChefState extends State<RegisterChef> {
  var formKey = GlobalKey<FormState>();

  String name;
  String email;
  String password;
  String mobileNumber;
  String skills;
  String imageUrl;
  File logo;
  bool isChecked = false;

  saveForm() async {
    bool validate = formKey.currentState.validate();
    if (isChecked) {
      if (validate) {
        formKey.currentState.save();
        AppUser appUser = AppUser.chefUser({
          'userName': this.name,
          'email': this.email,
          'password': this.password,
          'logo': this.logo,
          'mobileNumber': this.mobileNumber,
          'logoUrl': this.imageUrl,
          'skills': this.skills,
          'isChef': true
        });

        await saveUserInFirebase(appUser, context)
            .then((value) => ExtendedNavigator.of(context).push(
                  Routes.inActive,
                ));
      } else {
        return;
      }
    } else {
      showDialog(
        context: context,
        builder: (_) => Dialog(
          child: Container(
            width: 200,
            height: 120,
            child: Column(
              children: [
                Text(
                  translator.translate('plz_accpet_terms'),
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(
                  onPressed: () {
                    ExtendedNavigator.of(context).pop();
                  },
                  child: Text(
                    translator.translate('ok'),
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  String validateName(String value) {
    if (value == null || value == '') {
      return translator.translate('required_field');
    }
    if (value.length < 3) {
      return translator.translate('short');
    }
  }

  saveName(String newValue) {
    name = newValue;
  }

  String validateEmail(String value) {
    if (value == null || value == '') {
      return translator.translate('required_field');
    } else if (value.length < 3) {
      return translator.translate('short');
    } else if (!isEmail(value)) {
      return translator.translate('incorrect');
    }
  }

  saveEmail(String newValue) {
    email = newValue;
  }

  String validatePassword(String value) {
    if (value == null || value == '') {
      return translator.translate('required_field');
    } else if (value.length < 3) {
      return translator.translate('short');
    }
  }

  savePassword(String newValue) {
    password = newValue;
  }

  String validatePhone(String value) {
    if (value == null || value == '') {
      return translator.translate('required_field');
    } else if (value.length < 10) {
      return translator.translate('short');
    }
  }

  savePhone(String newValue) {
    mobileNumber = newValue;
  }

  String validateDescription(String value) {
    if (value == null || value == '') {
      return translator.translate('required_field');
    } else if (value.length < 30) {
      return translator.translate('short');
    }
  }

  saveDesc(String newValue) {
    skills = newValue;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(
        title: 'register_chef_title',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              trailing: Image.asset('assets/images/user.png'),
              title: translator.translate('new_chef_register'),
              subtitle: translator.translate('new_chef_register_sub'),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  MyTextField(
                    keyboardType: TextInputType.name,
                    hintText: translator.translate('chef_name'),
                    icon: Icon(
                      FontAwesomeIcons.user,
                      size: 16,
                    ),
                    validator: validateName,
                    onSaved: saveName,
                  ),
                  MyTextField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: translator.translate('email'),
                    icon: Icon(
                      FontAwesomeIcons.mailBulk,
                      size: 16,
                    ),
                    validator: validateEmail,
                    onSaved: saveEmail,
                  ),
                  MyTextField(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: translator.translate('password'),
                    lines: 1,
                    isSecure: true,
                    icon: Icon(
                      FontAwesomeIcons.key,
                      size: 16,
                    ),
                    validator: validatePassword,
                    onSaved: savePassword,
                  ),
                  MyTextField(
                    keyboardType: TextInputType.number,
                    hintText: translator.translate('phone'),
                    icon: Icon(
                      FontAwesomeIcons.phone,
                      size: 16,
                    ),
                    validator: validatePhone,
                    onSaved: savePhone,
                  ),
                  Selector<ChefProvider, File>(
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () async {
                          PickedFile pickedFile = await ImagePicker()
                              .getImage(source: ImageSource.gallery);
                          File file = File(pickedFile.path);
                          Provider.of<ChefProvider>(context, listen: false)
                              .setFile(file);
                        },
                        child: UploadImage(
                          text: translator.translate('user_logo'),
                          imgUrl: imageUrl,
                        ),
                      );
                    },
                    selector: (x, y) {
                      return y.file;
                    },
                  ),
                  MyTextField(
                    keyboardType: TextInputType.text,
                    lines: 8,
                    hintText: translator.translate('skills'),
                    validator: validateDescription,
                    onSaved: saveDesc,
                  ),
                  MyCheckBox(
                    isChecked: isChecked,
                    title: translator.translate('accept_terms'),
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  MyButton(
                    text: translator.translate('register_button'),
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
