import 'package:chefo/models/ads.dart';
import 'package:chefo/widgets/my_app_drawer.dart';

import 'package:chefo/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class AdDetails extends StatelessWidget {
  Ads ad;

  AdDetails(this.ad);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.email,
                color: Colors.orangeAccent,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.phone,
                color: Colors.blue,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.error_outline,
                color: Colors.red,
              )),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.share,
              color: Colors.green,
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
      endDrawer: AppDrawer(),
      appBar: MyAppBar(
        title: 'تفاصيل الإعلان',
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              height: size.height * (250 / size.height),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(ad.imageUrl)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    color: Colors.grey,
                    offset: Offset(1.0, 1.0), //(x,y)
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * (15 / size.height),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      ad.title,
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      ad.description,
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      ad.description,
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.end,
                    ),
                  ),

                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      title: Text(
                        ad.owner,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      trailing: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          ad.imageUrl,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
