// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/about.dart';
import '../screens/home.dart';
import '../screens/register.dart';
import '../screens/register_chef.dart';
import '../screens/register_restaurant.dart';
import '../screens/splash.dart';

class Routes {
  static const String splash = '/';
  static const String register = '/Register';
  static const String home = '/Home';
  static const String registerChef = '/register-chef';
  static const String registerRestaurant = '/register-restaurant';
  static const String about = '/About';
  static const all = <String>{
    splash,
    register,
    home,
    registerChef,
    registerRestaurant,
    about,
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
  };
}
