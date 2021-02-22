import 'package:chefo/backend/restaurant_provider.dart';
import 'package:chefo/backend/server.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantMembers extends StatefulWidget {
  @override
  _RestaurantMembersState createState() => _RestaurantMembersState();
}

class _RestaurantMembersState extends State<RestaurantMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'restaurant_requests',
      ),
      endDrawer: AppDrawer(),
      body: Consumer<RestaurantProvider>(
        builder: (context, value, child) => ListView.separated(
          itemCount: value.restaurantModel.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) => ListTile(
            title: Text(
              value.restaurantModel[index].userName,
              style: Theme.of(context).textTheme.headline6,
            ),
            trailing: Checkbox(
              value: value.restaurantModel[index].isActive,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (valuee) {
                setState(() {
                  value.restaurantModel[index].isActive = valuee;
                  changeRestaurantStatus(value.restaurantModel[index]);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
