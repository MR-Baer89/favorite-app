import 'package:favorites_app/models/favoritesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Früchte'),
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, provider, child) {
          final favoriteFruits = provider.favoriteFruits;
          if (favoriteFruits.isEmpty) {
            return const Center(
              child: Text('Keine Favoriten ausgewählt.'),
            );
          }
          return ListView.builder(
            itemCount: favoriteFruits.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(favoriteFruits[index]),
              );
            },
          );
        },
      ),
    );
  }
}
