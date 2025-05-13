import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/screen/home/restaurant_card_widget.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Restaurant',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        color: const Color.fromRGBO(71, 78, 87, 1.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Recommendation restaurant for you!',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Restaurant List
              Expanded(
                child: Consumer<RestaurantListProvider>(
                  builder: (context, value, child) {
                    return switch (value.resultState) {
                      RestaurantListLoadingState() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      RestaurantListLoadedState(
                        restaurantList: var restaurantList,
                      ) =>
                        ListView.separated(
                          itemCount: restaurantList.length,
                          separatorBuilder:
                              (_, __) => const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final restaurant = restaurantList[index];
                            return RestaurantCardWidget(
                              restaurant: restaurant,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  NavigationRoute.detailRoute.path,
                                  arguments: restaurant.id,
                                );
                              },
                            );
                          },
                        ),
                      RestaurantListErrorState(message: var message) => Center(
                        child: Text(
                          message,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      RestaurantListNoneState() => const Center(
                        child: Text('No data'),
                      ),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
