import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scre_shop_reloaded/domain/orderItem.dart';
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
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          ListTile(
              leading: const Text("Total"),
              trailing: TextButton(
                onPressed: () {
                  setState(() {
                    if (productProvider.cart.isNotEmpty) {
                      productProvider.addOrder(OrderItem(
                          cartItems: List.of(productProvider.cart),
                          datetime: DateTime.now(),
                          orderNumber: productProvider.orderNumber));
                      productProvider.wipeCart();
                      SnackBar snackBar = SnackBar(
                          content: Text("placed order"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      SnackBar snackBar = SnackBar(
                          content: Text("cart is empty"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
                child: const Text(
                  "Order Now",
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              title: Text("€${productProvider.getTotalCartPrice().toStringAsFixed(2)}")),
          Expanded(
            child: ListView.builder(
              itemCount: productProvider.cart.length,
              itemBuilder: (context, index) {
                return CartItemTile(cartItem: productProvider.cart[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
