import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scre_shop_reloaded/pages/detailedProductPage.dart';
import 'package:scre_shop_reloaded/pages/productManagementPage.dart';
import 'package:scre_shop_reloaded/pages/productPage.dart';
import 'package:scre_shop_reloaded/providers/cartProvider.dart';
import 'package:scre_shop_reloaded/providers/productProvider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/products",
      routes: {
        "/products": (context) => const ProductPage(),
        "/management": (context) => const ProductManagementPage(),
        "/detail": (context) => const DetailedProductPage()
      },
    );
  }
}
