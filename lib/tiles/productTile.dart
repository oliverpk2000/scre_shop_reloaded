import 'package:flutter/material.dart';

import '../domain/product.dart';

class ProductTile extends StatefulWidget {
  final Product product;

  const ProductTile({super.key,  required this.product});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: ,
    );
  }
}
