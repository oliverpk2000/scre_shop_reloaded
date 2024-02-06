import 'package:flutter/material.dart';

import '../domain/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 1,
      title: 'linux mascot plushie',
      description: 'his name is tux',
      price: 29.99,
      imageUrl:
      'http://store.tobinio.at/file/opk/linux_plushie.jpg',
    ),
    Product(
      id: 2,
      title: 'openSUSE mascot plushie',
      description: 'will blend in perfectly with your room',
      price: 34.99,
      imageUrl:
      'http://store.tobinio.at/file/opk/openSUSE_plushie.jpg',
    ),
    Product(
      id: 3,
      title: 'rush mascot plushie',
      description: 'our most memory safe plushie',
      price: 19.99,
      imageUrl:
      'http://store.tobinio.at/file/opk/rust_plushie.jpg',
    ),
    Product(
      id: 4,
      title: 'go mascot plushie',
      description: 'this one is part of our standard library',
      price: 29.99,
      imageUrl:
      'http://store.tobinio.at/file/opk/go_plushie.jpg',
    ),
  ];

  var isFavoriteTapped = false;

  List<Product> get items {
    if (isFavoriteTapped)
      return _items.where((product) => product.isFavourite).toList();
    return [..._items];
  }

  Product findById(int productId) {
    return _items.firstWhere((p) => p.id == productId);
  }

  void showFavorite() {
    isFavoriteTapped = true;
    notifyListeners();
  }

  void showAll() {
    isFavoriteTapped = false;
    notifyListeners();
  }
}