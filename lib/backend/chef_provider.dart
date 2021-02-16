import 'dart:io';

import 'package:chefo/models/chef_model.dart';
import 'package:chefo/models/users_model.dart';
import 'package:flutter/material.dart';

class ChefProvider extends ChangeNotifier {
  AppUser appUser;

  File file;
  List<ChefModel> chefModel = [];

  setChefs(List<ChefModel> value) {
    this.chefModel = value;
    notifyListeners();
  }

  setAppUser(AppUser appUser) {
    this.appUser = appUser;
    notifyListeners();
  }

  setFile(File file) {
    this.file = file;
    notifyListeners();
  }
}
