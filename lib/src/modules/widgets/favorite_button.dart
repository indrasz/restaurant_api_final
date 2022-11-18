import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodyar_final/src/providers/favorite_provider.dart';
import 'package:foodyar_final/src/res/res.dart';
import 'package:provider/provider.dart';
import '../../data/models/restaurant.dart';

class FavoriteButton extends StatelessWidget {
  final Restaurant favorite;

  const FavoriteButton({Key? key, required this.favorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isFavorited(favorite.id),
          builder: (context, snapshot,) {
            var isFavorite = snapshot.data ?? false;
            return isFavorite
                ? InkWell(
              onTap: () {
                provider.removeFavorite(favorite.id);
                Fluttertoast.showToast(
                    msg: 'Mengahapus dari favorite',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kRedColor,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.favorite_rounded,
                  color: kRedColor,
                ),
              ),
            )
                : InkWell(
              onTap: () {
                provider.addFavorite(favorite);
                Fluttertoast.showToast(
                    msg: 'Menambahkan ke favorite',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kGreenColor,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.favorite_outline_rounded,
                  color: kGreyColor,
                ),
              ),
            );
          },
        );
      },
    );
  }
}