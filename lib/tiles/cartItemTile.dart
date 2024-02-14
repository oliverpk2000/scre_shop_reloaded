import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scre_shop_reloaded/domain/cartItem.dart';

import '../providers/productProvider.dart';

class CartItemTile extends StatefulWidget {
  final CartItem cartItem;

  const CartItemTile({super.key, required this.cartItem});

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue)),
      margin: const EdgeInsets.all(15.0),
      child: ListTile(
          leading: Text(
            "€${widget.cartItem.product.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
              "total: €${widget.cartItem.product.price *
                  widget.cartItem.amount}"),
          title: Text(widget.cartItem.product.title),
          trailing: FittedBox(
            fit: BoxFit.fill,
            child: Row(children: [IconButton(onPressed: () {
              setState(() {
                productProvider.removeCartItemById(widget.cartItem.product.id);
              });
            }, icon: const Icon(Icons.delete)),
              Text("x${widget.cartItem.amount}",
                  style: const TextStyle(fontWeight: FontWeight.bold))
            ]),
          )),
    );
  }
}
