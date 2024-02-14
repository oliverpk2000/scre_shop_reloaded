import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scre_shop_reloaded/domain/product.dart';

import '../providers/productProvider.dart';

class DetailedProductPage extends StatefulWidget {

  const DetailedProductPage({super.key});

  @override
  State<DetailedProductPage> createState() => _DetailedProductPageState();
}

class _DetailedProductPageState extends State<DetailedProductPage> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Product product = productProvider.items.firstWhere((product) => product.id == productProvider.getPointer());
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Text(product.title),
          Image.network(product.imageUrl),
          Text(product.description),
          Text("${product.price}"),

        ],
      ),
    );
  }
}
