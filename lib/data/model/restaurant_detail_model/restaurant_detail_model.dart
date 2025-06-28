class RestaurantDetailResponse {
  final bool error;
  final String message;
  final RestaurantDetailModel restaurant;

  RestaurantDetailResponse({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailResponse(
      error: json['error'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      restaurant: RestaurantDetailModel.fromJson(json['restaurant']),
    );
  }
}

class RestaurantDetailModel {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menus menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  RestaurantDetailModel({
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

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      pictureId: json['pictureId'] as String,
      categories:
          (json['categories'] as List)
              .map((e) => Category.fromJson(e))
              .toList(),
      menus: Menus.fromJson(json['menus']),
      rating: (json['rating'] as num).toDouble(),
      customerReviews:
          (json['customerReviews'] as List)
              .map((e) => CustomerReview.fromJson(e))
              .toList(),
    );
  }
  // Method untuk generate URL gambar
  String get smallPictureUrl =>
      'https://restaurant-api.dicoding.dev/images/small/$pictureId';

  String get mediumPictureUrl =>
      'https://restaurant-api.dicoding.dev/images/medium/$pictureId';

  String get largePictureUrl =>
      'https://restaurant-api.dicoding.dev/images/large/$pictureId';

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "description": description,
      "city": city,
      "address": address,
      "pictureId": pictureId,
      "categories": categories.map((e) => e.toJson()).toList(),
      "menus": menus.toJson(),
      "rating": rating,
      "customerReviews": customerReviews.map((e) => e.toJson()).toList(),
    };
  }
}

class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(name: json['name'] as String);
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{"name": name};
  }
}

class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) {
    return CustomerReview(
      name: json['name'] as String,
      review: json['review'] as String,
      date: json['date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"name": name, "review": review, "date": date};
  }
}

class Menus {
  final List<Category> foods;
  final List<Category> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      foods: (json['foods'] as List).map((e) => Category.fromJson(e)).toList(),
      drinks:
          (json['drinks'] as List).map((e) => Category.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "foods": foods.map((e) => e.toJson()).toList(),
      "drinks": drinks.map((e) => e.toJson()).toList(),
    };
  }
}
