import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/product.dart';
import '../providers/productProvider.dart';
import '../tiles/drawer.dart';
import '../tiles/productTile.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late bool favourites = false;

  @override
  Widget build(BuildContext context) {
    ProductProvider products = Provider.of<ProductProvider>(context);
    return Scaffold(
      drawer: const Drawer(child: CustomDrawer()),
      appBar: AppBar(
        title: const Text("Web-shop"),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
              onPressed: () {
                if(favourites){
                  products.showAll();
                }else{
                  products.showFavorite();
                }
                favourites = !favourites;
              },
              icon: (favourites) ? (const Icon(Icons.favorite)) : (Icon(Icons.favorite_outline))),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
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
