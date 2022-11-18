import 'package:foodyar_final/src/data/models/restaurant.dart';
import 'dart:convert';

SearchRestaurantModel searchRestaurantModelFromJson(String str) =>
    SearchRestaurantModel.fromJson(json.decode(str));

String searchRestaurantModelToJson(SearchRestaurantModel data) =>
    json.encode(data.toJson());

class SearchRestaurantModel {
  SearchRestaurantModel({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<Restaurant> restaurants;

  factory SearchRestaurantModel.fromJson(Map<String, dynamic> json) =>
      SearchRestaurantModel(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<Restaurant>.from(
          json["restaurants"].map(
            (x) => Restaurant.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "founded": founded,
        "restaurants": List<dynamic>.from(
          restaurants.map(
            (x) => x.toJson(),
          ),
        ),
      };
}
