import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';

class RestaurantCardWidget extends StatelessWidget {
  final Function() onTap;
  final RestaurantModel restaurant;

  const RestaurantCardWidget({
    super.key,
    required this.onTap,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: [
            // Restaurant Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 80,
                  minHeight: 80,
                  maxWidth: 120,
                  maxHeight: 120,
                ),
                child: Hero(
                  tag: restaurant.smallPictureUrl,
                  child: Image.network(restaurant.smallPictureUrl, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(width: 16.0),

            // Restaurant Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        restaurant.city,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.amber[400]),
                      const SizedBox(width: 4.0),
                      Text(
                        restaurant.rating.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
