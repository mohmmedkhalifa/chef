import 'dart:io';

import 'package:chefo/models/users_model.dart';
import 'package:flutter/material.dart';

class ChefProvider extends ChangeNotifier {
  AppUser appUser;

  File file;

  setAppUser(AppUser appUser) {
    this.appUser = appUser;
    notifyListeners();
  }

  setFile(File file) {
    this.file = file;
    notifyListeners();
  }
}
