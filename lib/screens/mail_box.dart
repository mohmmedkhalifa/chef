import 'package:auto_route/auto_route.dart';

import 'package:chefo/models/route.gr.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:chefo/widgets/my_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class MailBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[50],
      appBar: MyAppBar(
        title: 'messages',
      ),
      endDrawer: AppDrawer(),
      // body: ListView.builder(
      //   itemCount: users.length,
      //   itemBuilder: (context, index) {
      //     return Column(
      //       children: [
      //         SizedBox(
      //           height: 16,
      //         ),
      //         HeaderWidget(
      //           onTap: () {
      //             ExtendedNavigator.of(context).push(Routes.conversation);
      //           },
      //           title: users[index].from,
      //           subtitle: users[index].message,
      //           trailing: CircleAvatar(
      //             backgroundImage: AssetImage(users[index].imageUrl),
      //           ),
      //         ),
      //         Divider()
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
