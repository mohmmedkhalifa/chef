import 'package:chefo/widgets/my_admin_panel.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ControlPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: MyAppBar(
        title: 'control_panel',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyAdminPanel(title: 'member_requests',index: '1',),
          MyAdminPanel(title: 'test2sssddddddddssssss',index: '2',),
          MyAdminPanel(title: 'testd3',index: '3',),
        ],
      ),
    );
  }
}
