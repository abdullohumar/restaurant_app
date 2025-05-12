import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_list_model.dart';

class ApiServices {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<RestaurantListModel> getRestaurantList() async {
    final response = await http.get(Uri.parse('$_baseUrl/list'));

    if (response.statusCode == 200) {
      return RestaurantListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }
}