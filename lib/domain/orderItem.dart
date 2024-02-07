import 'cartItem.dart';

class OrderItem{
  final String id;
  final double amount;
  final List<CartItem> orderedProducts;
  final DateTime datetime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.orderedProducts,
    required this.datetime,
  });
}