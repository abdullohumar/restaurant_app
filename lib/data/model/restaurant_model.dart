class RestaurantModel {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  RestaurantModel({required this.id, required this.name, required this.description, required this.pictureId, required this.city, required this.rating});

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      pictureId: json['pictureId'] as String,
      city: json['city'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }

  // Method untuk generate URL gambar
  String get smallPictureUrl =>
      'https://restaurant-api.dicoding.dev/images/small/$pictureId';

  String get mediumPictureUrl =>
      'https://restaurant-api.dicoding.dev/images/medium/$pictureId';

  String get largePictureUrl =>
      'https://restaurant-api.dicoding.dev/images/large/$pictureId';
}