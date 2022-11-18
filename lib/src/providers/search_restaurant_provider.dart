
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:foodyar_final/src/data/models/search_restaurant_model.dart';
import 'package:foodyar_final/src/data/services/api_services.dart';
import 'package:foodyar_final/src/utils/enums.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchRestaurantProvider({required this.apiService, required String query}) {
    _getSearchRestaurant(query);
  }
  late SearchRestaurantModel _restResult;
  late ResultState _state;
  String _message = '';

  SearchRestaurantModel get restResult => _restResult;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> _getSearchRestaurant(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final result = await apiService.searchRestaurant(query);
      if (result.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        _message = 'Empty data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restResult = result;
      }
    } on SocketException catch (_) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No internet connection';
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }
}