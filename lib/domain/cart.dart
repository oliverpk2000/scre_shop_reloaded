import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final double price;

  Cart({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}