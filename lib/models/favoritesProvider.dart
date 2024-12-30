import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  final List<String> _fruits = [
    'Apple',
    'Banana',
    'Erdbeere',
    'Birne',
    'Mango',
    'Cherry',
    'Coconut'
  ];

  final List<String> _favoriteFruits = [];

  List<String> get fruits => _fruits;

  List<String> get favoriteFruits => _favoriteFruits;

  void toggleFavorite(String fruit) {
    if (_favoriteFruits.contains(fruit)) {
      _favoriteFruits.remove(fruit);
    } else {
      _favoriteFruits.add(fruit);
    }
    notifyListeners();
  }
}
