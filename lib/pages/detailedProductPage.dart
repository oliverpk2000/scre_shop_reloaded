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
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Image.network(product.imageUrl),
              Text(product.description),
              Text("${product.price}€"),
            ],
          ),
        ),
      ),
    );
  }
}
