import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    Future.microtask(() {
      context.read<LocalDatabaseProvider>().loadAllRestaurant();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyFavorite')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<LocalDatabaseProvider>(
          builder: (context, value, child) {
            final favoriteList = value.restaurantList;
        
            // Tambahkan pengecekan null agar aman
            if (favoriteList == null) {
              return const Center(child: CircularProgressIndicator());
            }
        
            return favoriteList.isNotEmpty
                ? ListView.builder(
                  itemCount: favoriteList.length,
                  itemBuilder: (context, index) {
                    final restaurant = favoriteList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RestaurantCardWidget(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NavigationRoute.detailRoute.path,
                            arguments: restaurant.id,
                          );
                        },
                        restaurant: restaurant,
                      ),
                    );
                  },
                )
                : const Center(child: Text("No Bookmarked"));
          },
        ),
      ),
    );
  }
}
