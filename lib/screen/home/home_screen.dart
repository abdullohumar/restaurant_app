import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/screen/home/restaurant_card_widget.dart';
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
    Future.microtask((){
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [              
                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Restaurant',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Color.fromRGBO(71, 78, 87, 1.0),
                        ),
                      ),
                      Text(
                        'Recommendation restaurant for you!',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Restaurant List
                Expanded(
                  child: Consumer<RestaurantListProvider>(
                    builder: (context, value, child) {
                      return switch (value.resultState){
                        RestaurantListLoadingState() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        RestaurantListLoadedState(restaurantList: var restaurantList) => ListView.builder(
                          itemCount: restaurantList.length,
                          itemBuilder: (context, index) {
                            final restaurant = restaurantList[index];
                            return RestaurantCardWidget(
                              restaurant: restaurant,
                              onTap: (){}
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
                        )
                      };
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}