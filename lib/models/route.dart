import 'package:auto_route/auto_route_annotations.dart';
import 'package:chefo/screens/about.dart';
import 'package:chefo/screens/ad_details.dart';
import 'package:chefo/screens/contact.dart';
import 'package:chefo/screens/home.dart';
import 'package:chefo/screens/register.dart';
import 'package:chefo/screens/register_chef.dart';
import 'package:chefo/screens/register_restaurant.dart';
import 'package:chefo/screens/splash.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: Splash, initial: true),
    MaterialRoute(page: Register),
    MaterialRoute(page: Home),
    MaterialRoute(page: RegisterChef),
    MaterialRoute(page: RegisterRestaurant),
    MaterialRoute(page: About),
    MaterialRoute(page: Contact),
    MaterialRoute(page: AdDetails,),
  ],
)
class $CustomRouter {}
