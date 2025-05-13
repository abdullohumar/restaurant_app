import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model/restaurant_detail_model.dart';

class BodyOfDetail extends StatelessWidget {
  final RestaurantDetailModel restaurantDetail;

  const BodyOfDetail({super.key, required this.restaurantDetail});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Hero(
              tag: restaurantDetail.smallPictureUrl,
              child: Image.network(
                restaurantDetail.largePictureUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Nama dan kota
          Text(
            restaurantDetail.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_city, size: 18, color: Colors.grey),
              const SizedBox(width: 4),
              Text(restaurantDetail.city),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, size: 18, color: Colors.grey),
              const SizedBox(width: 4),
              Text(restaurantDetail.address),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, size: 18, color: Colors.orange),
              const SizedBox(width: 4),
              Text(restaurantDetail.rating.toString()),
            ],
          ),

          const SizedBox(height: 16),

          // Kategori
          const Text(
            'Categories:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 8.0,
            children: restaurantDetail.categories
                .map((category) => Chip(label: Text(category.name)))
                .toList(),
          ),

          const SizedBox(height: 16),

          // Deskripsi
          const Text(
            'Description:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            restaurantDetail.description,
            textAlign: TextAlign.justify,
          ),

          const SizedBox(height: 16),

          // Menu Makanan
          const Text(
            'Food Menu:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: restaurantDetail.menus.foods
                .map((food) => Chip(label: Text(food.name)))
                .toList(),
          ),

          const SizedBox(height: 16),

          // Menu Minuman
          const Text(
            'Drink Menu:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: restaurantDetail.menus.drinks
                .map((drink) => Chip(label: Text(drink.name)))
                .toList(),
          ),

          const SizedBox(height: 16),

          // Review pelanggan
          const Text(
            'Customer Reviews:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...restaurantDetail.customerReviews.map(
            (review) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(child: Text(review.name[0])),
              title: Text(review.name),
              subtitle: Text('"${review.review}"\n${review.date}'),
            ),
          ),
        ],
      ),
    );
  }
}
