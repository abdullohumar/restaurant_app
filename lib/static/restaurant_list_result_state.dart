import 'package:restaurant_app/data/model/restaurant_model.dart';

sealed class RestaurantListResultState {}

class RestaurantListNoneState extends RestaurantListResultState {}

class RestaurantListLoadingState extends RestaurantListResultState {}

class RestaurantListErrorState extends RestaurantListResultState {
  final String message;

  RestaurantListErrorState(this.message);
}

class RestaurantListLoadedState extends RestaurantListResultState {
  final List<RestaurantModel> restaurantList;
  
  RestaurantListLoadedState({required this.restaurantList});
}