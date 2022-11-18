import 'package:flutter/material.dart';
import 'package:foodyar_final/src/data/models/restaurant.dart';
import 'package:foodyar_final/src/modules/pages/detail_page.dart';
import 'package:foodyar_final/src/res/res.dart';

import 'bookmark_button.dart';

class RestaurantTile extends StatelessWidget {

  final Restaurant restaurant;

  const RestaurantTile({
    required this.restaurant,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(
            context,
            rootNavigator: true,
          ).push(
            MaterialPageRoute(
              builder: (context) {
                return DetailPage(id: restaurant.id);
              },
            ),
          );
        },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, right: 8, left: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    restaurant.getMediumPicture(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    restaurant.city,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        height: 15,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/icon_star.png',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        restaurant.rating.toString(),
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
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