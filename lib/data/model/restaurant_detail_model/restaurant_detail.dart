import 'package:restaurant_app/data/model/restaurant_detail_model/category_detail.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model/customer_review_detail.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model/menus_detail.dart';

class RestaurantDetail {
    final String id;
    final String name;
    final String description;
    final String city;
    final String address;
    final String pictureId;
    final List<CategoryDetail> categories;
    final Menus menus;
    final double rating;
    final List<CustomerReviewDetail> customerReviews;

    RestaurantDetail({
        required this.id,
        required this.name,
        required this.description,
        required this.city,
        required this.address,
        required this.pictureId,
        required this.categories,
        required this.menus,
        required this.rating,
        required this.customerReviews,
    });

    factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    return RestaurantDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      pictureId: json['pictureId'] as String,
      categories: (json['categories'] as List)
          .map((category) => CategoryDetail.fromJson(category))
          .toList(),
      menus: Menus.fromJson(json['menus']),
      rating: (json['rating'] as num).toDouble(),
      customerReviews: (json['customerReviews'] as List)
          .map((review) => CustomerReviewDetail.fromJson(review))
          .toList(),
    );
  }

  // Method untuk mendapatkan URL gambar
  String get smallPictureUrl => 
      'https://restaurant-api.dicoding.dev/images/small/$pictureId';
  String get mediumPictureUrl => 
      'https://restaurant-api.dicoding.dev/images/medium/$pictureId';
  String get largePictureUrl => 
      'https://restaurant-api.dicoding.dev/images/large/$pictureId';
}
