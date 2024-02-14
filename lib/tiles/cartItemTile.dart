import 'package:flutter/material.dart';
import 'package:scre_shop_reloaded/domain/cartItem.dart';

class CartItemTile extends StatefulWidget {
  final CartItem cartItem;

  const CartItemTile({super.key, required this.cartItem});

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  @override
  Widget build(BuildContext context) {

    return ListTile(
        leading: Container(
          height: 50,
          child: Text("${widget.cartItem.product.price * widget.cartItem.amount}", style: const TextStyle(backgroundColor: Colors.lightBlue),),
        ),
        title: Text(widget.cartItem.product.title),
        trailing: Text("x${widget.cartItem.amount}")
    );
  }
}
