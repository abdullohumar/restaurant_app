import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/home/restaurant_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [              
              // Title
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 27.0, 16.0, 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Restaurant',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.black,
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
                child: ListView.builder(
                  padding: const EdgeInsets.all(20.0),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return RestaurantCardWidget();
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