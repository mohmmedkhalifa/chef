import 'package:auto_route/auto_route.dart';
import 'package:chefo/backend/server.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_button.dart';
import 'package:chefo/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:string_validator/string_validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();

  String email;
  String password;

  saveForm() async {
    bool validate = formKey.currentState.validate();
    if (validate) {
      formKey.currentState.save();
      await signInUsingEmailAndPassword(email, password).then(
          (value) => ExtendedNavigator.of(context).push(Routes.controlPanel));
    } else {
      return;
    }
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(
        title: 'login',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.08,
                ),
                Text(
                  translator.translate('login'),
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                        lines: 1,
                        validator: validatePassword,
                        onSaved: savePassword,
                        hintText: translator.translate('password'),
                        keyboardType: TextInputType.visiblePassword,
                        isSecure: true,
                        icon: Icon(
                          FontAwesomeIcons.key,
                          size: 16,
                        ),
                      ),
                      MyButton(
                        text: translator.translate('login'),
                        onTap: saveForm,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            translator.translate('no_account'),
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                            onTap: (){
                              ExtendedNavigator.of(context).push(Routes.register);
                            },
                            child: Text(
                              translator.translate('register'),
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
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
