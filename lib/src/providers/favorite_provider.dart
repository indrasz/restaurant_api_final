import 'package:flutter/material.dart';
import 'package:foodyar_final/src/data/db/favorite_db.dart';
import 'package:foodyar_final/src/data/models/restaurant.dart';
import 'package:foodyar_final/src/utils/enums.dart';

class FavoriteProvider extends ChangeNotifier{
  final FavoriteDatabase favoriteDatabase;

  FavoriteProvider({required this.favoriteDatabase}){
    getFavorite();
  }

  ResultState? _state;
  ResultState? get state => _state;

  String _message = '';
  String get message => _message;

  List<Restaurant> _favorite = [];
  List<Restaurant> get favorite => _favorite;

  void getFavorite() async{
    _favorite = await favoriteDatabase.getFavorite();
    if(_favorite.isNotEmpty){
      _state = ResultState.hasData;
    }else{
      _state = ResultState.noData;
      _message = 'Empty Favorite';
    }
    notifyListeners();
  }

  void addFavorite(Restaurant restaurant) async{
    try{
      await favoriteDatabase.insertFavorite(restaurant);
      getFavorite();
    }catch (e){
      _state = ResultState.error;
      _message = 'Error $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(String id) async{
    final favoriteRestaurant = await favoriteDatabase.getFavoriteById(id);
    return favoriteRestaurant.isNotEmpty;
  }

  void removeFavorite(String id)async{
    try{
      await favoriteDatabase.removeFavorite(id);
      getFavorite();
    }catch (e){
      _state = ResultState.error;
      _message = 'Error $e';
      notifyListeners();
    }
  }
}