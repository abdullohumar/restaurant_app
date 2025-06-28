import 'package:restaurant_app/data/model/restaurant_detail_model/restaurant_detail_model.dart';

sealed class RestaurantDetailResultState {}

class RestaurantDetailNoneState extends RestaurantDetailResultState {}

class RestaurantDetailLoadingState extends RestaurantDetailResultState {}

class RestaurantDetailErrorState extends RestaurantDetailResultState {
  final String message;

  RestaurantDetailErrorState(this.message);
}

class RestaurantDetailLoadedState extends RestaurantDetailResultState {
  final List<RestaurantDetailModel> restaurantDetails;

  RestaurantDetailLoadedState({
    required this.restaurantDetails,
  });
}