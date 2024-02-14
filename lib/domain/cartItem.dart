import 'package:flutter/cupertino.dart';
import 'package:scre_shop_reloaded/domain/product.dart';

class CartItem with ChangeNotifier {
  final Product product;
  int amount;

  CartItem({
    required this.product,
    required this.amount,
  });
}