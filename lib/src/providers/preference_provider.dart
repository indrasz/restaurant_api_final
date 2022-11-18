
import 'package:flutter/material.dart';
import 'package:foodyar_final/src/helper/preference_helper.dart';

class PreferenceProvider extends ChangeNotifier{
  PreferenceHelper preferenceHelper;

  PreferenceProvider({required this.preferenceHelper}){
    _getDailyRestaurant();
  }

  bool _isDailyRestaurantActive = false;
  bool get isDailyRestaurant => _isDailyRestaurantActive;

  void _getDailyRestaurant() async{
    _isDailyRestaurantActive = await preferenceHelper.isDailyRestaurantActive;
    notifyListeners();
  }

  void enableDailyRestaurant(bool value){
    preferenceHelper.setDailyRestaurant(value);
    _getDailyRestaurant();
  }
}