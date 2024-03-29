import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavourite = false,
  });

  void toggleFavorite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}