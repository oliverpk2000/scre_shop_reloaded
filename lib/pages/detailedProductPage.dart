import 'package:flutter/material.dart';
import 'package:scre_shop_reloaded/domain/product.dart';

class DetailedProductPage extends StatefulWidget {
  final Product product;

  const DetailedProductPage({super.key, required this.product});

  @override
  State<DetailedProductPage> createState() => _DetailedProductPageState();
}

class _DetailedProductPageState extends State<DetailedProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Text(widget.product.title),
          Image.network(widget.product.imageUrl),
          Text(widget.product.description),
          Text("${widget.product.price}"),

        ],
      ),
    );
  }
}
