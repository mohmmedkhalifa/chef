import 'package:auto_route/auto_route.dart';
import 'package:chefo/backend/ads_provider.dart';
import 'package:chefo/backend/repository.dart';
import 'package:chefo/backend/server.dart';
import 'package:chefo/models/route.gr.dart';
import 'package:chefo/widgets/my_app_bar.dart';
import 'package:chefo/widgets/my_app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllAds extends StatefulWidget {
  @override
  _AllAdsState createState() => _AllAdsState();
}

class _AllAdsState extends State<AllAds> {
  @override
  void initState() {
    getAllAds(Repository.repository.appUser.userId, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: MyAppBar(
        title: 'all_ads',
      ),
      body: Consumer<AdsProvider>(
        builder: (context, value, child) => value.ads.length == 0
            ? Center(
                child: Text('Try Add some Ads'),
              )
            : ListView.builder(
                itemCount: value.ads.length,
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    onTap: () {
                      ExtendedNavigator.of(context).push(Routes.adDetails,
                          arguments: AdDetailsArguments(ad: value.ads[index]));
                    },
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    leading: Container(
                      width: 80,
                      height: 80,
                      child: Image.network(
                        value.ads[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(value.ads[index].title),
                    subtitle: Text(value.ads[index].description),
                  ),
                ),
              ),
      ),
    );
  }
}
