import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:chefo/backend/admin_provider.dart';
import 'package:chefo/backend/ads_provider.dart';
import 'package:chefo/backend/chef_provider.dart';
import 'package:chefo/backend/repository.dart';
import 'package:chefo/backend/restaurant_provider.dart';
import 'package:chefo/models/admin_model.dart';
import 'package:chefo/models/ads.dart';
import 'package:chefo/models/chef_model.dart';
import 'package:chefo/models/restaurant_model.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/models/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;
final String collectionName = 'users';

Future<String> registerUsingEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential = await firebaseAuth
      .createUserWithEmailAndPassword(email: email, password: password);
  return userCredential.user.uid;
}

Future<AppUser> signInUsingEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password);
  DocumentSnapshot documentSnapshot = await firestore
      .collection(collectionName)
      .doc(userCredential.user.uid)
      .get();

  Map map = documentSnapshot.data();

  map['userId'] = userCredential.user.uid;

  AppUser appUser = AppUser.newUser(map);
  Repository.repository.appUser = appUser;
  return appUser;
}

String getUserId() {
  String userId =
      firebaseAuth.currentUser != null ? firebaseAuth.currentUser.uid : null;
  return userId;
}

signOut(context) async {
  await firebaseAuth.signOut();
  ExtendedNavigator.of(context).push(Routes.login);
}

saveUserInFirebase(AppUser appUser, context) async {
  try {
    String userId =
        await registerUsingEmailAndPassword(appUser.email, appUser.password);
    Map map = appUser.toJson();
    map.remove('password');
    bool isRestaurant = appUser.type == userType.restaurant;
    if (isRestaurant) {
      map['logoUrl'] = await uploadImage(
          Provider.of<RestaurantProvider>(context, listen: false).file);

      appUser.logoUrl = map['logoUrl'];
    } else {
      map['logoUrl'] = await uploadImage(
          Provider.of<ChefProvider>(context, listen: false).file);

      appUser.logoUrl = map['logoUrl'];
    }

    await firestore.collection(collectionName).doc(userId).set(map);
    Repository.repository.appUser = appUser;
  } on Exception catch (e) {}
}

Future<String> uploadImage(File file, [bool isProductImage = false]) async {
  String fileName = file.path.split('/').last;
  String folderName = isProductImage ? 'productImages' : 'logos';
  Reference reference = storage.ref('$folderName/$fileName');
  await reference.putFile(file);
  String imageUrl = await reference.getDownloadURL();
  return imageUrl;
}

Future<AppUser> getUserFromFirebase() async {
  String userId = getUserId();

  DocumentSnapshot documentSnapshot =
      await firestore.collection(collectionName).doc(userId).get();
  Map map = documentSnapshot.data();
  map['userId'] = userId;
  AppUser appUser = AppUser.newUser(map);

  return appUser;
}

fetchSplashData(context) async {
  getAdmin(context);

  AppUser appUser = await getUserFromFirebase();
  Repository.repository.appUser = appUser;
  if (appUser.isAdmin ?? false) {
    ExtendedNavigator.of(context).push(Routes.controlPanel);
  } else if (appUser.isActive ?? false) {
    ExtendedNavigator.of(context).push(Routes.home);
  } else {
    ExtendedNavigator.of(context).push(Routes.inActive);
  }
}

getAdmin(context) async {
  QuerySnapshot querySnapshot = await firestore
      .collection('users')
      .where('isAdmin', isEqualTo: true)
      .get();
  print(querySnapshot);
  List<AdminModel> admins = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['userId'] = e.id;
    return AdminModel.fromMap(map);
  }).toList();
  Provider.of<AdminProvider>(context, listen: false).setAdmin(admins);
}

getAllChef(context) async {
  QuerySnapshot querySnapshot = await firestore
      .collection('users')
      .where('isChef', isEqualTo: true)
      .get();
  List<ChefModel> chefModel = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['chefId'] = e.id;
    return ChefModel.fromJson(map);
  }).toList();
  Provider.of<ChefProvider>(context, listen: false).setChefs(chefModel);
}

Future<List<RestaurantModel>> getAllRestaurant(context) async {
  QuerySnapshot querySnapshot = await firestore
      .collection('users')
      .where('isRestaurant', isEqualTo: true)
      .get();
  List<RestaurantModel> restaurantModel = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['restId'] = e.id;
    return RestaurantModel.fromJson(map);
  }).toList();
  Provider.of<RestaurantProvider>(context, listen: false)
      .setRests(restaurantModel);
  return restaurantModel;
}

changeChefStatus(ChefModel chefModel) async {
  firestore
      .collection('users')
      .doc(chefModel.chefId)
      .update(chefModel.toJson());
}

changeRestaurantStatus(RestaurantModel restaurantModel) async {
  firestore
      .collection('users')
      .doc(restaurantModel.restId)
      .update(restaurantModel.toJson());
}

addNewAd(Map map, context) async {
  await firestore
      .collection('ads')
      .doc(Repository.repository.appUser.userId)
      .collection('RestaurantAds')
      .add({...map});

  ExtendedNavigator.of(context).push(Routes.allAds);
}

getAllAds(String restId, context) async {
  QuerySnapshot querySnapshot = await firestore
      .collection('ads')
      .doc(restId)
      .collection('RestaurantAds')
      .get();

  List<Ads> ads = querySnapshot.docs.map((e) {
    Map map = e.data();
    map['adId'] = e.id;
    return Ads.fromJson(map);
  }).toList();
  Provider.of<AdsProvider>(context, listen: false).setAds(ads);
}

getAllAdsHome(context) async {
  List<RestaurantModel> restaurantModel = await getAllRestaurant(context);

  for (int i = 0; i < restaurantModel.length; i++) {
    QuerySnapshot querySnapshot = await firestore
        .collection('ads')
        .doc(restaurantModel[i].restId)
        .collection('RestaurantAds')
        .get();

    List<Ads> ad = querySnapshot.docs
        .map((e) {
          Map map = e.data();

          return Ads.fromJson(map);
        })
        .toSet()
        .toList();

    Provider.of<AdsProvider>(context, listen: false).setAllAds(ad[0]);
  }
}
