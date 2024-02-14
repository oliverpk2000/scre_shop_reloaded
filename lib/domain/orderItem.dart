import 'cartItem.dart';

class OrderItem{
  final CartItem cartItem;
  final DateTime datetime;

  OrderItem({
    required this.cartItem,
    required this.datetime,
  });
}