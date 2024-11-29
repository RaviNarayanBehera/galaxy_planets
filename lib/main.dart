import 'package:flutter/material.dart';
import 'package:galaxy_planets/provider/planet.provider.dart';
import 'package:galaxy_planets/view/fav_planet_page.dart';
import 'package:galaxy_planets/view/planet_detail_page.dart';
import 'package:galaxy_planets/view/planet_page.dart';
import 'package:galaxy_planets/view/planet_splash_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlanetProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Solar System Planets',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const PlanetPage(),
          '/favorites': (context) => FavoritesPage(),
          '/planetDetail': (context) => PlanetDetailPage(),
        },
      ),
    );
  }
}
