import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model/restaurant_detail_model.dart';
import 'package:restaurant_app/provider/detail/favorite_icon_provider.dart';
import 'package:restaurant_app/provider/favorite/local_database_provider.dart';

class FavoriteIconWidget extends StatefulWidget {
  final RestaurantDetailModel restaurant;
  const FavoriteIconWidget({super.key, required this.restaurant});

  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  @override
  void initState() async {
    final localDatabaseProvider = context.read<LocalDatabaseProvider>();
    final favoriteIconProvider = context.read<FavoriteIconProvider>();

    Future.microtask(() async {
      await localDatabaseProvider.loadRestaurantById(widget.restaurant.id);
      final value = localDatabaseProvider.checkItemBookmark(widget.restaurant.id);

      favoriteIconProvider.isFavorite = value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final localDatabaseProvider = context.read<LocalDatabaseProvider>();
        final favoriteIconProvider = context.read<FavoriteIconProvider>();
        final isFavorite = favoriteIconProvider.isFavorite;

        if (!isFavorite) {
         await localDatabaseProvider.saveRestaurant(widget.restaurant);
       } else {
         await localDatabaseProvider.removeRestaurantById(widget.restaurant.id);
       }
        favoriteIconProvider.isFavorite = !isFavorite;
        localDatabaseProvider.loadAllRestaurant();
      },
      icon: Icon(
        context.watch<FavoriteIconProvider>().isFavorite
            ? Icons.favorite
            : Icons.favorite_border_outlined,
      ),
    );
  }
}
