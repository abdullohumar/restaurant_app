import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Image
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Melting Pot',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://restaurant-api.dicoding.dev/images/medium/14',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rating and Categories
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.star, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text(
                              '4.2',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Wrap(
                        spacing: 8,
                        children: [
                          Chip(
                            label: const Text('Italia'),
                            backgroundColor: Colors.grey[200],
                            padding: EdgeInsets.zero,
                            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          Chip(
                            label: const Text('Modern'),
                            backgroundColor: Colors.grey[200],
                            padding: EdgeInsets.zero,
                            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Location
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey[600], size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Jln. Pandeglang no 19, Medan',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.directions),
                        label: const Text('Directions'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                const Divider(),

                // Description
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.',
                        style: TextStyle(
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      TextButton(
                        child: const Text('Read more'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                const Divider(),

                // Menu
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Menu',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TabBar(
                        controller: _tabController,
                        labelColor: Colors.amber,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.amber,
                        tabs: const [
                          Tab(text: 'Foods'),
                          Tab(text: 'Drinks'),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Foods Tab
                            ListView(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              children: [
                                _buildMenuItem('Paket rosemary', '50.000'),
                                _buildMenuItem('Toastie salmon', '45.000'),
                                _buildMenuItem('Bebek crepes', '60.000'),
                                _buildMenuItem('Salad lengkeng', '35.000'),
                              ],
                            ),
                            // Drinks Tab
                            GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 3,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              children: [
                                _buildDrinkItem('Es krim'),
                                _buildDrinkItem('Sirup'),
                                _buildDrinkItem('Jus apel'),
                                _buildDrinkItem('Jus jeruk'),
                                _buildDrinkItem('Coklat panas'),
                                _buildDrinkItem('Es kopi'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(),

                // Reviews
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Reviews',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            child: const Text('Write a Review'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    child: const Text('A'),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Ahmad',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '13 November 2019',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'Tidak rekomendasi untuk pelajar!',
                                style: TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Book a Table Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Book a Table',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String name, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.restaurant, color: Colors.grey),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Rp $price',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDrinkItem(String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.local_drink, size: 16),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}