import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/product.dart';
import '../providers/productProvider.dart';

class ProductTile extends StatefulWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  late ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return GridTile(
      header: GridTileBar(
        title: Text(widget.product.title),
        backgroundColor: Colors.lightBlue,
      ),
      child: Image.network(widget.product.imageUrl),
      footer: Row(
        children: [
          Text("${widget.product.price}"),
          IconButton(
              onPressed: () {
                setState(() {
                  productProvider.toggleFavouriteById(widget.product.id);
                });
              },
              icon: Icon((widget.product.isFavourite)
                  ? (Icons.favorite_outlined)
                  : (Icons.favorite_outline))),
          Text("TODO: cart btn"),
        ],
      ),
    );
  }
}
