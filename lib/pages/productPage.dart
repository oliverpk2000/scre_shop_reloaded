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
    ProductProvider products = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web-shop"),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, "/management");
          }, icon: const Icon(Icons.edit))
        ],
      ),
      body: Column(
        children: [
          const Text("products"),
          TextButton(onPressed: () {
            products.showFavorite();
          }, child: const Text("show favourites")),
          TextButton(onPressed: () {
            products.showAll();
          }, child: const Text("show all")),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: products.items.length,
              itemBuilder: (context, index) {
                return ProductTile(product: products.items[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
