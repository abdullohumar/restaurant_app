import 'package:restaurant_app/data/model/restaurant_detail_model/restaurant_detail.dart';

class RestaurantDetailModel {
    final bool error;
    final String message;
    final RestaurantDetail restaurant;

    RestaurantDetailModel({
        required this.error,
        required this.message,
        required this.restaurant,
    });

    factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailModel(
      error: json['error'] as bool,
      message: json['message'] as String,
      restaurant: RestaurantDetail.fromJson(json['restaurant']),
    );
  }
}




