import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scre_shop_reloaded/tiles/cartItemTile.dart';

import '../providers/productProvider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: productProvider.cart.length,
            itemBuilder: (context, index){
              return CartItemTile(cartItem: productProvider.cart[index]);
            },
            ),
          )
        ],
      ),
    );
  }
}
