import 'dart:io';

import 'package:chefo/models/admin_model.dart';
import 'package:chefo/models/users_model.dart';
import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  AppUser appUser;

  File file;
  List<AdminModel> admins;

  setAppUser(AppUser appUser) {
    this.appUser = appUser;
    notifyListeners();
  }

  setAdmin(List<AdminModel> value) {
    this.admins = value;
    notifyListeners();
  }

  setFile(File file) {
    this.file = file;
    notifyListeners();
  }
}
