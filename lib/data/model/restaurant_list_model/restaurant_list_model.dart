import 'package:restaurant_app/data/model/restaurant_list_model/restaurant_model.dart';

class RestaurantListModel {
  final bool error;
  final String message;
  final int count;
  final List<RestaurantModel> restaurant;

  RestaurantListModel({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurant,
  });

  factory RestaurantListModel.fromJson(Map<String, dynamic> json) {
    return RestaurantListModel(
      error: json['error'],
      message: json['message'],
      count: json['count'],
      restaurant: (List<RestaurantModel>.from(
        json['restaurants'].map((x) => RestaurantModel.fromJson(x)),
      )),
    );
  }
}
