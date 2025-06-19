import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/model/restaurant_list_model/restaurant_model.dart';

class FavoriteListProvider extends ChangeNotifier{
  final List<RestaurantModel> _favoriteList = [];
  List<RestaurantModel> get favoriteList => _favoriteList;

  void addFavorite(RestaurantModel value) {
    _favoriteList.add(value);
    notifyListeners();
  }

  void removeBookmark(RestaurantModel value) {
    _favoriteList.removeWhere((e) => e.id == value.id);
    notifyListeners();
  }

  bool checkItemBookmark(RestaurantModel value) {
    final restaurantInList = _favoriteList.where((e) => e.id == value.id);
    return restaurantInList.isNotEmpty;
  }
}