import 'package:chefo/models/ads.dart';
import 'package:chefo/models/users_model.dart';
import 'package:flutter/material.dart';

class AdsProvider extends ChangeNotifier {
  Ads selectedRestaurant;
  AppUser appUser;

  setAppUser(AppUser appUser) {
    this.appUser = appUser;
    notifyListeners();
  }

  bool isMail = false;
  bool isShare = false;

  changeCallAllowed() {
    this.isMail = !this.isMail;
    notifyListeners();
  }

  changeMessagesAllowed() {
    this.isShare = !this.isShare;
    notifyListeners();
  }

  List<Ads> ads = [];

  setAds(List<Ads> value) {
    this.ads = value;
    notifyListeners();
  }

  List<Ads> allAds = [];

  setAllAds(Ads value) async {
    this.allAds.add(value);

    notifyListeners();
  }
}
