import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:chefo/backend/admin_provider.dart';
import 'package:chefo/backend/chef_provider.dart';
import 'package:chefo/backend/repository.dart';
import 'package:chefo/backend/restaurant_provider.dart';
import 'package:chefo/models/admin_model.dart';
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

signInUsingEmailAndPassword(String email, String password) async {
  UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password);
  DocumentSnapshot documentSnapshot = await firestore
      .collection(collectionName)
      .doc(userCredential.user.uid)
      .get();
  Logger().d(documentSnapshot.data());
  Map map = documentSnapshot.data();
  Logger().d(map);
  map['userId'] = userCredential.user.uid;
  Logger().d(map['userId']);
  AppUser appUser = AppUser.newUser(map);
  Repository.repository.appUser = appUser;
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
