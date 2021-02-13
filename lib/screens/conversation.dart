import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Conversation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: MyAppBar(
        title:'conversation',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 40, right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: ListTile(
                tileColor: Colors.white,
                subtitle: Text(
                  '10:05',
                  textAlign: TextAlign.end,
                ),
                title: Text(
                  'مرحباً',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.headline2,
                ),
                trailing: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/rest1.png'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 8, right: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: ListTile(
                tileColor: Colors.white,
                subtitle: Text('10:10'),
                title: Text(
                  'أهلاً بك',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline2,
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/rest2.png'),
                ),
              ),
            ),
          ),
          Spacer(),
          ListTile(
            leading: Icon(
              Icons.emoji_emotions,
              color: Colors.yellow[600],
              size: 28,
            ),
            title: TextField(
              decoration: InputDecoration(
                hintText: translator.translate('write_msg'),
                border: OutlineInputBorder(),
              ),
            ),
            trailing: Icon(
              Icons.send,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
