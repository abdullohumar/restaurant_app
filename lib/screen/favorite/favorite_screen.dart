import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail/favorite_list_provider.dart';
import 'package:restaurant_app/provider/favorite/local_database_provider.dart';
import 'package:restaurant_app/screen/home/restaurant_card_widget.dart';
import 'package:restaurant_app/static/navigation_route.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    Future.microtask((){
      context.read<LocalDatabaseProvider>().loadAllRestaurant();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyFavorite')),
      body: Consumer<FavoriteListProvider>(
        builder: (context, value, child) {
          final favoriteList = value.favoriteList;
          return switch (favoriteList.isNotEmpty) {
            true => ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final restaurant = favoriteList[index];
                return RestaurantCardWidget(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NavigationRoute.detailRoute.path,
                      arguments: restaurant,
                    );
                  },
                  restaurant: restaurant,
                );
              },
            ),
            _ => const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Bookmarked")
                ],
              ),
            )
          };
        },
      ),
    );
  }
}
