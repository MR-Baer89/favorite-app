import 'package:favorites_app/models/favoritesProvider.dart';
import 'package:favorites_app/screens/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meine Früchte'),
        actions: [
          Consumer<FavoritesProvider>(
            builder: (context, provider, child) {
              return Stack(
                children: [
                  IconButton(
                    iconSize: 36,
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      // Navigation zur FavoritesScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoritesScreen(),
                        ),
                      );
                    },
                  ),
                  if (provider.favoriteFruits.isNotEmpty)
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          provider.favoriteFruits.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.fruits.length,
            itemBuilder: (context, index) {
              final fruit = provider.fruits[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color.fromARGB(255, 150, 202, 228),
                child: ListTile(
                  title: Text(fruit),
                  trailing: IconButton(
                    icon: Icon(
                      provider.favoriteFruits.contains(fruit)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: provider.favoriteFruits.contains(fruit)
                          ? Colors.red
                          : null,
                    ),
                    onPressed: () => provider.toggleFavorite(fruit),
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
