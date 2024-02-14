import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scre_shop_reloaded/providers/productProvider.dart';
import 'package:scre_shop_reloaded/tiles/drawer.dart';

class ProductManagementPage extends StatefulWidget {
  const ProductManagementPage({super.key});

  @override
  State<ProductManagementPage> createState() => _ProductManagementPageState();
}

class _ProductManagementPageState extends State<ProductManagementPage> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      drawer: const Drawer(child: CustomDrawer()),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Product Management"),
        actions: [
          IconButton(
              onPressed: () {
                productProvider.setPointer(-1);
                Navigator.pushNamed(context, "/edit");
              },
              icon: const Icon(Icons.add_circle_outline))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productProvider.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    height: 50,
                    child: Image.network(productProvider.items[index].imageUrl),
                  ),
                  title: Text(productProvider.items[index].title),
                  trailing: FittedBox(
                    fit: BoxFit.fill,
                    child: Row(children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            productProvider
                                .setPointer(productProvider.items[index].id);
                            Navigator.pushNamed(context, "/edit");
                          });
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              productProvider.deleteProductById(productProvider.items[index].id);
                            });
                          },
                          icon: const Icon(Icons.delete)),
                    ]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
