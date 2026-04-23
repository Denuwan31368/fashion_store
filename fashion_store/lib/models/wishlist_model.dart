import 'package:flutter/material.dart';
import 'product_model.dart';

class WishlistModel extends ChangeNotifier {
  final List<Product> _wishlistItems = [];

  List<Product> get items => _wishlistItems;

  void toggleWishlist(Product product) {
    if (_wishlistItems.contains(product)) {
      _wishlistItems.remove(product);
    } else {
      _wishlistItems.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _wishlistItems.contains(product);
  }

  void removeItem(Product product) {
    _wishlistItems.remove(product);
    notifyListeners();
  }
}