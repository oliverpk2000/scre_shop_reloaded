
import 'package:flutter/material.dart';
import 'package:scre_shop_reloaded/domain/cartItem.dart';

import '../domain/orderItem.dart';
import '../domain/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [
    Product(
      id: 1,
      title: 'linux mascot plushie',
      description: 'his name is tux',
      price: 29.99,
      imageUrl: 'http://store.tobinio.at/file/opk/linux_plushie.jpg',
    ),
    Product(
      id: 2,
      title: 'openSUSE mascot plushie',
      description: 'will blend in perfectly with your room',
      price: 34.99,
      imageUrl: 'http://store.tobinio.at/file/opk/openSUSE_plushie.jpg',
    ),
    Product(
      id: 3,
      title: 'rush mascot plushie',
      description: 'our most memory safe plushie',
      price: 19.99,
      imageUrl: 'http://store.tobinio.at/file/opk/rust_plushie.jpg',
    ),
    Product(
      id: 4,
      title: 'go mascot plushie',
      description: 'this one is part of our standard library',
      price: 29.99,
      imageUrl: 'http://store.tobinio.at/file/opk/go_plushie.jpg',
    ),
    Product(
      id: 5,
      title: 'python logo plushie',
      description: 'packaging this plushie is always a pain',
      price: 25.99,
      imageUrl: 'http://store.tobinio.at/file/opk/python_plushie.jpg',
    ),
    Product(
      id: 6,
      title: 'php mascot plushie',
      description: 'this one is making quite the comeback',
      price: 18.99,
      imageUrl: 'http://store.tobinio.at/file/opk/php_plushie.jpg',
    ),
    Product(
      id: 7,
      title: 'java mascot plushie',
      description: 'ships everywhere',
      price: 24.99,
      imageUrl: 'http://store.tobinio.at/file/opk/java_plushie.jpg',
    ),
  ];

  int pointer = -1;

  int lastId = 7;

  var onlyFavourites = false;

  List<CartItem> cart = [];

  List<OrderItem> orders = [];

  int orderNumber = 0;

  void incrementOrderNumber(){
    orderNumber++;
  }

  List<Product> get items {
    if (onlyFavourites) {
      return products.where((product) => product.isFavourite).toList();
    }
    return products;
  }

  Product findById(int productId) {
    return products.firstWhere((p) => p.id == productId);
  }

  void showFavorite() {
    onlyFavourites = true;
    notifyListeners();
  }

  void showAll() {
    onlyFavourites = false;
    notifyListeners();
  }

  void toggleFavouriteById(int productId) {
    products.firstWhere((p) => p.id == productId).toggleFavorite();
  }

  void deleteProductById(int productId) {
    int index = items.indexWhere((element) => element.id == productId);
    if(index >= 0){
      items.removeAt(index);
    }
    notifyListeners();
  }

  int getLastId() {
    return lastId;
  }

  void addProduct(Product newProduct) {
    items.add(newProduct);
    notifyListeners();
    lastId++;
  }

  void setPointer(int p) {
    pointer = p;
  }

  int getPointer() {
    return pointer;
  }

  void addCartItem(CartItem cartItem) {
    cart.add(cartItem);

    notifyListeners();
  }

  void removeCartItemById(int cartItemId) {
    int index = cart.indexWhere((element) => element.product.id == cartItemId);
    if(index >=0){
      cart.removeAt(index);
    }
    notifyListeners();
  }

  void incrementCartItem(CartItem cartItem) {
    int index =
        cart.indexWhere((element) => element.product.id == cartItem.product.id);
    if (index >= 0) {
      cart[index].amount++;
      notifyListeners();
    } else {
      addCartItem(cartItem);
    }
  }

  void changeProduct(Product newProduct) {
    items[items.indexWhere((element) => element.id == newProduct.id)] =
        newProduct;
    print(newProduct.title);
    notifyListeners();
  }

  double getTotalCartPrice() {
    if (cart.isEmpty) {
      print("empty cart");
      return 0.0;
    }
    return cart
        .map((e) => (e.product.price * e.amount))
        .reduce((a, b) => a + b);
  }

  addOrder(OrderItem orderItem){
    orders.add(orderItem);
    print(orderItem.datetime);
    incrementOrderNumber();
    notifyListeners();
  }

  void wipeCart(){
    cart.clear();
    notifyListeners();
  }
}
