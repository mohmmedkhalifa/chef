// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/about.dart';
import '../screens/ad_details.dart';
import '../screens/add_ads.dart';
import '../screens/contact.dart';
import '../screens/conversation.dart';
import '../screens/home.dart';
import '../screens/mail_box.dart';
import '../screens/register.dart';
import '../screens/register_chef.dart';
import '../screens/register_restaurant.dart';
import '../screens/restaurant_deatails.dart';
import '../screens/splash.dart';
import '../screens/terms.dart';
import 'ads.dart';
import 'restaurant.dart';

class Routes {
  static const String splash = '/';
  static const String register = '/Register';
  static const String home = '/Home';
  static const String registerChef = '/register-chef';
  static const String registerRestaurant = '/register-restaurant';
  static const String about = '/About';
  static const String contact = '/Contact';
  static const String adDetails = '/ad-details';
  static const String restaurantDetails = '/restaurant-details';
  static const String addAds = '/add-ads';
  static const String terms = '/Terms';
  static const String mailBox = '/mail-box';
  static const String conversation = '/Conversation';
  static const all = <String>{
    splash,
    register,
    home,
    registerChef,
    registerRestaurant,
    about,
    contact,
    adDetails,
    restaurantDetails,
    addAds,
    terms,
    mailBox,
    conversation,
  };
}

class CustomRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splash, page: Splash),
    RouteDef(Routes.register, page: Register),
    RouteDef(Routes.home, page: Home),
    RouteDef(Routes.registerChef, page: RegisterChef),
    RouteDef(Routes.registerRestaurant, page: RegisterRestaurant),
    RouteDef(Routes.about, page: About),
    RouteDef(Routes.contact, page: Contact),
    RouteDef(Routes.adDetails, page: AdDetails),
    RouteDef(Routes.restaurantDetails, page: RestaurantDetails),
    RouteDef(Routes.addAds, page: AddAds),
    RouteDef(Routes.terms, page: Terms),
    RouteDef(Routes.mailBox, page: MailBox),
    RouteDef(Routes.conversation, page: Conversation),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Splash: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Splash(),
        settings: data,
      );
    },
    Register: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Register(),
        settings: data,
      );
    },
    Home: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Home(),
        settings: data,
      );
    },
    RegisterChef: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterChef(),
        settings: data,
      );
    },
    RegisterRestaurant: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterRestaurant(),
        settings: data,
      );
    },
    About: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => About(),
        settings: data,
      );
    },
    Contact: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Contact(),
        settings: data,
      );
    },
    AdDetails: (data) {
      final args = data.getArgs<AdDetailsArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AdDetails(args.ad),
        settings: data,
      );
    },
    RestaurantDetails: (data) {
      final args = data.getArgs<RestaurantDetailsArguments>(
        orElse: () => RestaurantDetailsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => RestaurantDetails(
          restaurant: args.restaurant,
          ads: args.ads,
        ),
        settings: data,
      );
    },
    AddAds: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddAds(),
        settings: data,
      );
    },
    Terms: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Terms(),
        settings: data,
      );
    },
    MailBox: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MailBox(),
        settings: data,
      );
    },
    Conversation: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Conversation(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AdDetails arguments holder class
class AdDetailsArguments {
  final Ads ad;
  AdDetailsArguments({@required this.ad});
}

/// RestaurantDetails arguments holder class
class RestaurantDetailsArguments {
  final Restaurant restaurant;
  final List<Ads> ads;
  RestaurantDetailsArguments({this.restaurant, this.ads});
}
