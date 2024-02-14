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
    return GestureDetector(
      onTap: (){
        productProvider.setPointer(widget.product.id);
        Navigator.pushNamed(context, "/detail");
      },
      child: GridTile(
        header: GridTileBar(
          title: Text(widget.product.title),
          backgroundColor: Colors.lightBlue,
        ),
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
            IconButton(onPressed: (){

            }, icon: const Icon(Icons.shopping_cart)),
          ],
        ),
        child: Image.network(widget.product.imageUrl),
      ),
    );
  }
}
