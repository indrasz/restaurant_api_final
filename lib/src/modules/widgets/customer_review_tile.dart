import 'package:flutter/material.dart';
import 'package:foodyar_final/src/data/models/restaurant_detail.dart';
import 'package:foodyar_final/src/res/res.dart';

class CustomerReviewTile extends StatelessWidget {
  final CustomerReview review;

  const CustomerReviewTile({
    required this.review,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
        left: 12,
        right: 12,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 16),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://ui-avatars.com/api/?name=default+name',
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  review.review,
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
