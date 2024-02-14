import 'package:flutter/cupertino.dart';

import '../domain/cartItem.dart';

class CartProvider with ChangeNotifier{
  Map<String, CartItem> cartItems = {};
}