import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/screen/detail/body_of_detail.dart';
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
    Future.microtask(() {
      context.read<RestaurantDetailProvider>().fetchDetailRestaurant(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurant Detail')),
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
              BodyOfDetail(restaurantDetail: detail),
            _ => const Center(child: Text('No data')),
          };
        },
      ),
    );
  }
}
