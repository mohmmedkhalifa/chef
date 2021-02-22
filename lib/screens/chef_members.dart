import 'package:chefo/backend/chef_provider.dart';
import 'package:chefo/backend/server.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChefMembers extends StatefulWidget {
  @override
  _ChefMembersState createState() => _ChefMembersState();
}

class _ChefMembersState extends State<ChefMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'chef_requests',
      ),
      endDrawer: AppDrawer(),
      body: Consumer<ChefProvider>(
        builder: (context, value, child) => ListView.separated(
          itemCount: value.chefModel.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) => ListTile(
            title: Text(
              value.chefModel[index].userName,
              style: Theme.of(context).textTheme.headline6,
            ),
            trailing: Checkbox(
              value: value.chefModel[index].isActive,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (valuee) {
                setState(() {
                  value.chefModel[index].isActive = valuee;
                  changeChefStatus(value.chefModel[index]);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
