import 'package:auto_route/auto_route_annotations.dart';
import 'package:chefo/screens/about.dart';
import 'package:chefo/screens/ad_details.dart';
import 'package:chefo/screens/add_ads.dart';
import 'package:chefo/screens/contact.dart';
import 'package:chefo/screens/control_panel.dart';
import 'package:chefo/screens/conversation.dart';
import 'package:chefo/screens/home.dart';
import 'package:chefo/screens/in_active.dart';
import 'package:chefo/screens/login.dart';
import 'package:chefo/screens/mail_box.dart';
import 'package:chefo/screens/register.dart';
import 'package:chefo/screens/register_chef.dart';
import 'package:chefo/screens/register_restaurant.dart';
import 'package:chefo/screens/restaurant_deatails.dart';
import 'package:chefo/screens/register_intro.dart';
import 'package:chefo/screens/splash.dart';
import 'package:chefo/screens/terms.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: RegisterIntro),
    MaterialRoute(page: Register),
    MaterialRoute(page: Home),
    MaterialRoute(page: RegisterChef),
    MaterialRoute(page: RegisterRestaurant),
    MaterialRoute(page: About),
    MaterialRoute(page: Contact),
    MaterialRoute(page: AdDetails,),
    MaterialRoute(page: RestaurantDetails,),
    MaterialRoute(page: AddAds,),
    MaterialRoute(page: Terms,),
    MaterialRoute(page: MailBox,),
    MaterialRoute(page: Conversation,),
    MaterialRoute(page: Login,),
    MaterialRoute(page: InActive,),
    MaterialRoute(page: ControlPanel,),
    MaterialRoute(page: Splash,initial: true),


  ],
)
class $CustomRouter {}
