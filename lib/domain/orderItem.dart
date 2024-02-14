import 'cartItem.dart';

class OrderItem {
  final List<CartItem> cartItems;
  final DateTime datetime;
  final int orderNumber;

  OrderItem(
      {required this.cartItems,
      required this.datetime,
      required this.orderNumber});

  double totalOrderCost() {
    return cartItems
        .map((e) => (e.product.price * e.amount))
        .reduce((a, b) => a + b);
  }
}
