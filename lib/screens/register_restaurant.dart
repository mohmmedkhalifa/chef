import 'package:auto_route/auto_route.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:chefo/widgets/my_button.dart';
import 'package:chefo/widgets/my_checkbox.dart';
import 'package:chefo/widgets/my_header_widget.dart';
import 'package:chefo/widgets/my_text_field.dart';
import 'package:chefo/widgets/my_upload_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:string_validator/string_validator.dart';

class RegisterRestaurant extends StatefulWidget {
  @override
  _RegisterRestaurantState createState() => _RegisterRestaurantState();
}

class _RegisterRestaurantState extends State<RegisterRestaurant> {
  var formKey = GlobalKey<FormState>();

  String name;
  String restName;
  String email;
  String password;
  String phone;
  String description;
  bool isChecked = false;

  saveForm() {
    bool validate = formKey.currentState.validate();
    if (isChecked) {
      if (validate) {
        formKey.currentState.save();
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

  String validateRestName(String value) {
    if (value == null || value == '') {
      return translator.translate('required_field');
    }
    if (value.length < 3) {
      return translator.translate('short');
    }
  }

  saveRestName(String newValue) {
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
    phone = newValue;
  }

  String validateDescription(String value) {
    if (value == null || value == '') {
      return translator.translate('required_field');
    } else if (value.length < 50) {
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
      drawer: AppDrawer(),
      appBar: MyAppBar(
        title: 'register_restaurant_title',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(
                  trailing: Image.asset('assets/images/shop.png'),
                  title: translator.translate('new_rest_register'),
                  subtitle: translator.translate('new_rest_register_sub'),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        validator: validateRestName,
                        onSaved: saveRestName,
                        hintText: translator.translate('res_title'),
                        icon: Icon(
                          FontAwesomeIcons.store,
                          size: 18,
                        ),
                      ),
                      MyTextField(
                        validator: validateName,
                        onSaved: saveName,
                        hintText: translator.translate('res_owner'),
                        icon: Icon(
                          FontAwesomeIcons.user,
                          size: 18,
                        ),
                      ),
                      MyTextField(
                        validator: validateEmail,
                        onSaved: saveEmail,
                        hintText: translator.translate('email'),
                        icon: Icon(
                          FontAwesomeIcons.mailBulk,
                          size: 16,
                        ),
                      ),
                      MyTextField(
                        validator: validatePassword,
                        onSaved: savePassword,
                        hintText: translator.translate('password'),
                        icon: Icon(
                          FontAwesomeIcons.key,
                          size: 16,
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        title: Text(
                          translator.translate('location'),
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
                        validator: validatePhone,
                        onSaved: savePhone,
                        hintText: translator.translate('phone'),
                        icon: Icon(
                          FontAwesomeIcons.phone,
                          size: 16,
                        ),
                      ),
                      UploadImage(
                        text: translator.translate('logo'),
                      ),
                      MyTextField(
                        validator: validateDescription,
                        onSaved: saveDesc,
                        hintText: translator.translate('activity'),
                        icon: Icon(
                          FontAwesomeIcons.phoenixFramework,
                          size: 16,
                        ),
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
        ],
      ),
    );
  }
}
