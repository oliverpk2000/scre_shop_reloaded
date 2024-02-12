import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/product.dart';
import '../providers/productProvider.dart';
import '../tiles/productTile.dart';

class ProductPage extends StatefulWidget {

  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = context.watch<ProductProvider>().items;
    return Scaffold(
      appBar: AppBar(title: const Text("Web-shop"),
        backgroundColor: Colors.lightBlue,
      ),
      body:Column(
        children: [
          const Text("products"),
          ProductTile(product: products[0])
        ],
      ),
    );
  }
}
