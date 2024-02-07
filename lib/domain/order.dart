import 'cart.dart';

class Order{
  final String id;
  final double amount;
  final List<Cart> orderedProducts;
  final DateTime datetime;

  Order({
    required this.id,
    required this.amount,
    required this.orderedProducts,
    required this.datetime,
  });
}