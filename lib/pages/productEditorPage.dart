import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scre_shop_reloaded/domain/product.dart';

import '../providers/productProvider.dart';

class ProductEditorPage extends StatefulWidget {
  const ProductEditorPage({super.key});

  @override
  State<ProductEditorPage> createState() => _ProductEditorPageState();
}

class _ProductEditorPageState extends State<ProductEditorPage> {
  late int id = -1;
  late String title = "";
  late String description = "";
  late double price = 0.00;
  late String imageUrl = "";
  late bool firstLoadIn = true;
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    if(firstLoadIn){
      loadData(productProvider);
      firstLoadIn = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: (productProvider.getPointer() < 0)
            ? (const Text("add product"))
            : (const Text("edit product")),
        actions: [
          IconButton(
              onPressed: () {
                Product newProduct = Product(
                    id: id,
                    title: title,
                    description: description,
                    price: price,
                    imageUrl: imageUrl);
                if(productProvider.getPointer() < 0){
                  productProvider.addProduct(newProduct);
                  SnackBar snackBar = SnackBar(
                      content: Text("added new product"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }else{
                  SnackBar snackBar = const SnackBar(
                      content: Text("edits saved"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  productProvider.changeProduct(newProduct);
                }
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "product title"),
            autofocus: true,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                title = value;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "product description"),
            autofocus: true,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                description = value;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "price"),
            autofocus: true,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                price = double.parse(value);
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "image url"),
            autofocus: true,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                imageUrl = value;
              });
            },
          ),
          Expanded(
            child: (imageUrl.isEmpty)
                ? (const Text("image preview here"))
                : (Image.network(imageUrl)),
          )
        ],
      ),
    );
  }

  void loadData(ProductProvider productProvider) {
    if (productProvider.getPointer() >= 0) {
      setState(() {
        Product product = productProvider.items
            .firstWhere((p) => p.id == productProvider.getPointer());
        id = product.id;
        title = product.title;
        description = product.description;
        price = product.price;
        imageUrl = product.imageUrl;
      });
    } else {
      id = productProvider.lastId + 1;
    }
  }
}
