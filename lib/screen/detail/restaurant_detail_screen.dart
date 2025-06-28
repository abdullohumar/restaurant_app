import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail/favorite_icon_provider.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/provider/favorite/local_database_provider.dart';
import 'package:restaurant_app/screen/detail/body_of_detail.dart';
import 'package:restaurant_app/screen/detail/favorite_icon_widget.dart';
import 'package:restaurant_app/static/restaurant_detail_result_state.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final String id;
  const RestaurantDetailScreen({super.key, required this.id});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final provider = context.read<RestaurantDetailProvider>();
      await provider.fetchDetailRestaurant(widget.id);

      final state = provider.resultState;
      if (state is RestaurantDetailLoadedState) {
        final restaurant = state.restaurantDetails[0];
        final localDb = context.read<LocalDatabaseProvider>();
        final favIcon = context.read<FavoriteIconProvider>();

        await localDb.loadRestaurantById(restaurant.id);
        final isFav = localDb.checkItemBookmark(restaurant.id);
        favIcon.isFavorite = isFav;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoriteIconProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant Detail'),
          actions: [
            Consumer<RestaurantDetailProvider>(
              builder: (context, value, child) {
                return switch (value.resultState) {
                  RestaurantDetailLoadedState(restaurantDetails: var detail) =>
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FavoriteIconWidget(restaurant: detail[0]),
                    ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          ],
        ),
        body: Consumer<RestaurantDetailProvider>(
          builder: (context, provider, _) {
            final state = provider.resultState;

            return switch (state) {
              RestaurantDetailLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
              RestaurantDetailErrorState(message: var message) => Center(
                child: Text(message),
              ),
              RestaurantDetailLoadedState(restaurantDetails: var detail) =>
                BodyOfDetail(restaurantDetail: detail[0]),
              _ => const Center(child: Text('No data')),
            };
          },
        ),
      ),
    );
  }
}
