import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/static/restaurant_detail_result_state.dart';

class RestaurantDetailProvider extends ChangeNotifier{
  final ApiServices apiServices;

  RestaurantDetailProvider(this.apiServices);

  RestaurantDetailResultState _resultState = RestaurantDetailNoneState();
  RestaurantDetailResultState get resultState => _resultState;

  Future<void> fetchDetailRestaurant(String id) async {
    try {
      _resultState = RestaurantDetailLoadingState();
      notifyListeners();

      final result = await apiServices.getRestaurantDetail(id);
      _resultState = result.error
          ? RestaurantDetailErrorState(result.message)
          : RestaurantDetailLoadedState(restaurantDetails: result.restaurant);
          
      notifyListeners();
    } catch (e) {
      _resultState = RestaurantDetailErrorState(e.toString());
      notifyListeners();
    }
  }
}