import 'package:flutter/cupertino.dart';

import '../domain/cartItem.dart';

class CartProvider with ChangeNotifier{
  Map<String, CartItem> cartItems = {};

  Map<String, CartItem> get items {
    return cartItems;
  }

  int get itemCount {
    return cartItems.length;
  }

  double get totalAmount {
    var total = 0.0;
    cartItems.forEach((key, cartItem) {
      total = total + cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String id, double price, String title) {
    if (cartItems.containsKey(id)) {
      cartItems.update(
          id,
              (existing) => CartItem(
            id: existing.id,
            price: existing.price,
            quantity: existing.quantity + 1,
            title: existing.title,
          ));
    } else {
      cartItems.putIfAbsent(
          id,
              () => CartItem(
            id: DateTime.now().toString(),
            price: price,
            quantity: 1,
            title: title,
          ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    cartItems.remove(id);
    notifyListeners();
  }
}