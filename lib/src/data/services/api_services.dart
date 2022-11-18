import 'dart:convert';
import 'package:foodyar_final/src/data/models/restaurant.dart';
import 'package:foodyar_final/src/data/models/restaurant_detail.dart';
import 'package:foodyar_final/src/data/models/search_restaurant_model.dart';
import 'package:http/http.dart' as http;
import 'package:foodyar_final/src/utils/constants.dart';

class ApiService {

  Future<RestaurantModel> getListRestaurant(http.Client client) async {
    final response = await client.get(
      Uri.parse(ApiEndPoint.kApiList),
    );
    try{
      if (response.statusCode == 200) {
        return RestaurantModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    }catch(e) {
      rethrow;
    }

  }

  Future<SearchRestaurantModel> searchRestaurant(String query) async {
    final response = await http.get(
      Uri.parse('${ApiEndPoint.kApiSearch}?q=$query'),
    );
    if (response.statusCode == 200) {
      return SearchRestaurantModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Load data');
    }
  }

  Future<DetailRestaurantModel> getRestaurantById(String id) async {
    final response = await http.get(Uri.parse('${ApiEndPoint.kApiDetail}/$id'));
    if (response.statusCode == 200) {
      var dataJson = jsonDecode(response.body);
      var data = dataJson['restaurant'];
      return DetailRestaurantModel.fromJson(data);
    } else {
      throw Exception('Failed to load detail data');
    }
  }
}
