import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/home/home_screen.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/style/theme/restaurant_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: RestaurantTheme.lightTheme,
      darkTheme: RestaurantTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: NavigationRoute.mainRoute.path,
      routes: {
        NavigationRoute.mainRoute.path: (context) => const HomeScreen(),
        // NavigationRoute.detailRoute.path: (context) => const DetailScreen(),
      },
    );
  }
}