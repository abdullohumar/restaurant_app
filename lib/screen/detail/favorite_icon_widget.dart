import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model/restaurant_detail_model.dart';
import 'package:restaurant_app/provider/detail/favorite_icon_provider.dart';
import 'package:restaurant_app/provider/favorite/local_database_provider.dart';

class FavoriteIconWidget extends StatelessWidget {
  final RestaurantDetailModel restaurant;

  const FavoriteIconWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteIconProvider>();
    final isFavorite = favoriteProvider.isFavorite;

    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
      ),
      onPressed: () async {
        final localDb = context.read<LocalDatabaseProvider>();

        if (isFavorite) {
          await localDb.removeRestaurantById(restaurant.id);
        } else {
          await localDb.saveRestaurant(restaurant);
        }

        favoriteProvider.isFavorite = !isFavorite;
        localDb.loadAllRestaurant(); // Optional
      },
    );
  }
}