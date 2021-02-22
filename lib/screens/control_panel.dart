import 'package:auto_route/auto_route.dart';
import 'package:chefo/backend/chef_provider.dart';
import 'package:chefo/backend/repository.dart';
import 'package:chefo/backend/restaurant_provider.dart';
import 'package:chefo/backend/server.dart';
import 'package:chefo/models/route.gr.dart';

import 'package:chefo/widgets/my_admin_panel.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControlPanel extends StatefulWidget {
  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  @override
  void initState() {
    getAllChef(context);
    getAllRestaurant(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: MyAppBar(
        title: 'control_panel',
      ),
      body: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(Repository.repository.appUser.userName),
            accountEmail: Text(Repository.repository.appUser.email),
            currentAccountPicture: Repository.repository.appUser.logoUrl != null
                ? CircleAvatar(
                    backgroundImage:
                        NetworkImage(Repository.repository.appUser.logoUrl),
                  )
                : CircleAvatar(
                    child: Text(Repository.repository.appUser.userName[0]
                        .toUpperCase()),
                  ),
          ),
          Consumer<ChefProvider>(
            builder: (context, value, child) => MyAdminPanel(
              title: 'chef_requests',
              index: value.chefModel.length.toString(),
              onPressed: () {
                ExtendedNavigator.of(context).push(Routes.chefMembers);
              },
            ),
          ),
          Consumer<RestaurantProvider>(
            builder: (context, value, child) => MyAdminPanel(
              title: 'restaurant_requests',
              index: value.restaurantModel.length.toString(),
              onPressed: () {
                ExtendedNavigator.of(context).push(Routes.restaurantMembers);
              },
            ),
          ),
        ],
      ),
    );
  }
}
