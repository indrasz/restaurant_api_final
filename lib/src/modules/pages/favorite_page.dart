import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodyar_final/src/modules/widgets/restaurant_tile.dart';
import 'package:foodyar_final/src/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../../res/res.dart';
import '../../utils/enums.dart';
import '../widgets/platform_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kGreenColor,
    ));
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreenColor,
        elevation: 0,
        title: const Text('Favorite'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Favorite'),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.hasData) {
          return Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: ListView.builder(
              itemCount: provider.favorite.length,
              itemBuilder: (context, index) {
                final result = provider.favorite[index];
                return RestaurantTile(restaurant: result);
              },
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Belum ada data favorite',
                  style: TextStyle(fontSize: 16, fontWeight: bold),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
