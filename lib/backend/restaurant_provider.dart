import 'dart:io';

import 'package:chefo/models/restaurant_model.dart';
import 'package:chefo/models/users_model.dart';
import 'package:flutter/material.dart';

class RestaurantProvider extends ChangeNotifier {
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

  List<RestaurantModel> restaurantModel = [];

  setRests(List<RestaurantModel> value) {
    this.restaurantModel = value;
    notifyListeners();
  }
}
