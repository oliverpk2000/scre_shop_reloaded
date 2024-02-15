import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scre_shop_reloaded/tiles/orderItemTile.dart';

import '../providers/productProvider.dart';
import '../tiles/drawer.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      drawer: const Drawer(child: CustomDrawer()),
      appBar: AppBar(
        title: const Text("Orders"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: productProvider.orders.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: OrderItemTile(
                        orderItem: productProvider.orders[index]));
              },
            ),
          )
        ],
      ),
    );
  }
}
