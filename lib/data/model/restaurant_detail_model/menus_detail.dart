import 'package:restaurant_app/data/model/restaurant_detail_model/category_detail.dart';

class Menus {
    final List<CategoryDetail> foods;
    final List<CategoryDetail> drinks;

    Menus({
        required this.foods,
        required this.drinks,
    });

    factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      foods: (json['foods'] as List)
          .map((food) => CategoryDetail.fromJson(food))
          .toList(),
      drinks: (json['drinks'] as List)
          .map((drink) => CategoryDetail.fromJson(drink))
          .toList(),
    );
  }
}
