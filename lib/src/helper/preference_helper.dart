import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper{
  final Future<SharedPreferences> sharedPreferences;

  PreferenceHelper({required this.sharedPreferences});
  static const dailyNews = 'DAILY_NEWS';

  Future<bool> get isDailyRestaurantActive async{
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyNews) ?? false;
  }

  void setDailyRestaurant(bool value) async{
    final prefs = await sharedPreferences;
    prefs.setBool(dailyNews, value);
  }

}