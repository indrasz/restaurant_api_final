import 'package:flutter/material.dart';
import 'package:foodyar_final/src/providers/search_restaurant_provider.dart';
import 'package:foodyar_final/src/data/services/api_services.dart';
import 'package:foodyar_final/src/modules/widgets/restaurant_tile.dart';
import 'package:foodyar_final/src/res/res.dart';
import 'package:foodyar_final/src/utils/enums.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  final String query;

  const SearchPage({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kUnavailableColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kGreyColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              width: 120,
              height: 70,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/icon_logo.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ChangeNotifierProvider<SearchRestaurantProvider>(
        create: (context) => SearchRestaurantProvider(
          apiService: ApiService(),
          query: query,
        ),
        child: Consumer<SearchRestaurantProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.state == ResultState.hasData) {
              return ListView(
                padding: const EdgeInsets.all(8).copyWith(top: 40),
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.only(top: 0),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: state.restResult.restaurants.length,
                    itemBuilder: (context, index) {
                      var restaurant = state.restResult.restaurants[index];
                      return RestaurantTile(
                        restaurant: restaurant,
                      );
                    },
                  ),
                ],
              );
            } else if (state.state == ResultState.noData) {
              return Center(
                child: Material(
                  child: Text(state.message),
                ),
              );
            } else if (state.state == ResultState.error) {
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Lottie.asset('assets/json/no_internet.json'),
                ),
              );
            } else {
              return Center(
                child: Lottie.asset('assets/json/search_empty.json'),
              );
            }
          },
        ),
      ),
    );
  }
}
