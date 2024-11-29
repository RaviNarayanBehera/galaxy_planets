import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/planet.provider.dart';
import '../model/planet_model.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        ),
        title: const Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'Favorite Planets',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Consumer<PlanetProvider>(
        builder: (context, provider, child) {
          List<Planet> favoritePlanets = provider.planetModel!.planets
              .where((planet) => provider.isFavorite(planet))
              .toList();

          if (favoritePlanets.isEmpty) {
            return const Center(
              child: Text(
                'No favorite planets yet.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: favoritePlanets.length,
            itemBuilder: (context, index) {
              Planet planet = favoritePlanets[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to the planet details page
                  Navigator.of(context).pushNamed('/planetDetail', arguments: planet);
                },
                child: ListTile(
                  leading: Image.asset(planet.image),
                  title: Text('The ${planet.name}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    planet.short_des,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      provider.removeFavorite(planet);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
