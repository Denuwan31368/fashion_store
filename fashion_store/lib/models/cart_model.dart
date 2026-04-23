import 'package:flutter/material.dart';
import 'product_model.dart';

class CartItem {
  final Product product;
  int quantity;
  String selectedSize;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedSize = "M",
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  final double _shippingFee = 350.0;

  double get shippingFee => _shippingFee;

  void addToCart(Product product, {String size = "M"}) {
    int existingIndex = _cartItems.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.selectedSize == size,
    );

    if (existingIndex != -1) {
      _cartItems[existingIndex].quantity++;
    } 
    else {
      _cartItems.add(
        CartItem(
          product: product,
          selectedSize: size,
        ),
      );
    }

    notifyListeners();
  }

  void incrementQuantity(int index) {
    _cartItems[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(int index) {

    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
    } 
    else {
      _cartItems.removeAt(index);
    }

    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
  
  double get subtotal {
    double total = 0.0;

    for (var item in _cartItems) {
      String cleanPrice = item.product.price
          .replaceAll('Rs.', '')
          .replaceAll(',', '')
          .trim();

      double price = double.tryParse(cleanPrice) ?? 0.0;

      total += price * item.quantity;
    }
    return total;
  }
  double get totalAmount => subtotal + _shippingFee;
}