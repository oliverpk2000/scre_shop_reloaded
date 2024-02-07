import 'package:flutter/cupertino.dart';

import '../domain/cartItem.dart';
import '../domain/orderItem.dart';

class OrderProvider with ChangeNotifier{
  List<OrderItem> orderList = [];

  List<OrderItem> get orders {
    return orderList;
  }

  void addOder(List<CartItem> cartProducts, double total) {
    orderList.add(OrderItem(
      amount: total,
      datetime: DateTime.now(),
      id: DateTime.now().toString(),
      orderedProducts: cartProducts,
    ));

    notifyListeners();
  }

  void clearAll() {
    orderList = [];
    notifyListeners();
  }
}