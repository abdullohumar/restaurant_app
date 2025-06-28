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
  void initState() {
    super.initState();

    Future.microtask(() async {
      final localDatabaseProvider = context.read<LocalDatabaseProvider>();
      final favoriteIconProvider = context.read<FavoriteIconProvider>();

      await localDatabaseProvider.loadRestaurantById(widget.restaurant.id);
      final isBookmarked = localDatabaseProvider.checkItemBookmark(
        widget.restaurant.id,
      );

      // 🔧 Set setelah data dari database selesai diload
      favoriteIconProvider.isFavorite = isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteIconProvider>();
    final isFavorite = favoriteProvider.isFavorite;

    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border_outlined),
      onPressed: () async {
        final localDb = context.read<LocalDatabaseProvider>();

        if (isFavorite) {
          await localDb.removeRestaurantById(widget.restaurant.id);
        } else {
          await localDb.saveRestaurant(widget.restaurant);
        }

        favoriteProvider.isFavorite = !isFavorite;
        await localDb.loadAllRestaurant(); // optional
      },
    );
  }
}
