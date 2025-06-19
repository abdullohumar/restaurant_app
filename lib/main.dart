import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/data/local/local_database_service.dart';
import 'package:restaurant_app/provider/detail/favorite_list_provider.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/provider/favorite/local_database_provider.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/provider/main/index_nav_provider.dart';
import 'package:restaurant_app/screen/detail/restaurant_detail_screen.dart';
import 'package:restaurant_app/screen/main/main_screen.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/style/theme/restaurant_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ApiServices()),
        ChangeNotifierProvider(
          create:
              (context) => RestaurantListProvider(
                Provider.of<ApiServices>(context, listen: false),
              ),
        ),
        ChangeNotifierProvider(
          create:
              (context) => RestaurantDetailProvider(
                Provider.of<ApiServices>(context, listen: false),
              ),
        ),
        ChangeNotifierProvider(create: (context) => IndexNavProvider()),
        Provider(create: (context) => LocalDatabaseService()),
        ChangeNotifierProvider(create: (context) => LocalDatabaseProvider(
          context.read<LocalDatabaseService>()
        )),
        ChangeNotifierProvider(create: (context) => FavoriteListProvider()),
      ],
      child: MyApp(),
    ),
  );
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
        NavigationRoute.mainRoute.path: (context) => const MainScreen(),
        NavigationRoute.detailRoute.path: (context) => RestaurantDetailScreen(
          id: ModalRoute.of(context)?.settings.arguments as String,
        ),
      },
    );
  }
}
