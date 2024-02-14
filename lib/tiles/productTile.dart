import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scre_shop_reloaded/domain/cartItem.dart';

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
      onTap: () {
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
            Text("€${widget.product.price}"),
            IconButton(
                onPressed: () {
                  setState(() {
                    productProvider.toggleFavouriteById(widget.product.id);
                  });
                  SnackBar snackBar = SnackBar(
                      content: (widget.product.isFavourite)
                          ? (Text(
                              "added ${widget.product.title} to favourites"))
                          : (Text(
                              "removed ${widget.product.title} from favourites")));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: Icon((widget.product.isFavourite)
                    ? (Icons.favorite_outlined)
                    : (Icons.favorite_outline))),
            IconButton(
                onPressed: () {
                  productProvider.incrementCartItem(
                      CartItem(product: widget.product, amount: 1));
                  SnackBar snackBar = SnackBar(
                      content: Text("added ${widget.product.title} to cart"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.shopping_cart)),
          ],
        ),
        child: Image.network(widget.product.imageUrl),
      ),
    );
  }
}
