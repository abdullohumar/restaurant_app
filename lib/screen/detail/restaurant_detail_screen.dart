import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://restaurant-api.dicoding.dev/images/large/14',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Nama dan kota
            Text(
              'Melting Pot',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                Icon(Icons.location_city, size: 18, color: Colors.grey),
                SizedBox(width: 4),
                Text('Medan'),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                Icon(Icons.location_on, size: 18, color: Colors.grey),
                SizedBox(width: 4),
                Text('Jln. Pandeglang no 19'),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                Icon(Icons.star, size: 18, color: Colors.orange),
                SizedBox(width: 4),
                Text('4.2'),
              ],
            ),

            const SizedBox(height: 16),

            // Kategori
            const Text('Categories:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Wrap(
              spacing: 8.0,
              children: [
                Chip(label: Text('Italia')),
                Chip(label: Text('Modern')),
              ],
            ),

            const SizedBox(height: 16),

            // Deskripsi
            const Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text(
              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor...',
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 16),

            // Menu Makanan
            const Text('Food Menu:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Wrap(
              spacing: 8.0,
              children: [
                Chip(label: Text('Paket rosemary')),
                Chip(label: Text('Toastie salmon')),
                Chip(label: Text('Bebek crepes')),
                Chip(label: Text('Salad lengkeng')),
              ],
            ),

            const SizedBox(height: 16),

            // Menu Minuman
            const Text('Drink Menu:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: const [
                Chip(label: Text('Es krim')),
                Chip(label: Text('Sirup')),
                Chip(label: Text('Jus apel')),
                Chip(label: Text('Jus jeruk')),
                Chip(label: Text('Coklat panas')),
                Chip(label: Text('Air')),
                Chip(label: Text('Es kopi')),
                Chip(label: Text('Jus alpukat')),
                Chip(label: Text('Jus mangga')),
                Chip(label: Text('Teh manis')),
                Chip(label: Text('Kopi espresso')),
                Chip(label: Text('Minuman soda')),
                Chip(label: Text('Jus tomat')),
              ],
            ),

            const SizedBox(height: 16),

            // Review pelanggan
            const Text('Customer Reviews:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(child: Text('A')),
              title: Text('Ahmad'),
              subtitle: Text('"Tidak rekomendasi untuk pelajar!"\n13 November 2019'),
            ),
          ],
        ),
      ),
    );
  }
}
