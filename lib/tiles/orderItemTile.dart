import 'package:flutter/material.dart';

import '../domain/orderItem.dart';

class OrderItemTile extends StatefulWidget {
  final OrderItem orderItem;

  const OrderItemTile({super.key, required this.orderItem});

  @override
  State<OrderItemTile> createState() => _OrderItemTileState();
}

class _OrderItemTileState extends State<OrderItemTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Text("#${widget.orderItem.orderNumber}"),
      title: Text("${widget.orderItem.totalOrderCost().toStringAsFixed(2)}€"),
      subtitle: Text(widget.orderItem.datetime.toString()),
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.orderItem.cartItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widget.orderItem.cartItems[index].product.title),
              trailing: Text(
                "${widget.orderItem.cartItems[index].amount}x${widget.orderItem.cartItems[index].product.price}€",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
        )
      ],
    );
  }
}
