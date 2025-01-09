import 'package:flutter/material.dart';
import 'package:inventory_management_app/models/product_model.dart';

class HomeProvider extends ChangeNotifier {
  int addToCartListLength = 0;
  List<String> addToCartList = [];
  List<ProductModel> productList = [];

  increaseaddToCartListLength() {
    addToCartListLength += 1;
  }

  decrementaddToCartListLength() {
    addToCartListLength -= 1;
  }

  intitalizeProductList(List items) {
    productList.clear();
    for (var item in items) {
      productList.add(ProductModel.fromJson(item.data(), item.id));
    }
  }

  getProductIndex(String id) {
    int index = 0;
    for (var item in productList) {
      if (item.id == id) {
        return index;
      }
      index += 1;
    }
  }

  addToCart(String id) {
    final productIndex = getProductIndex(id);

    if (!addToCartList.contains(id)) {
      addToCartList.add(id);
      increaseaddToCartListLength();
      productList[productIndex].isAddToCart = true;
    } else {
      addToCartList.remove(id);
      decrementaddToCartListLength();
      productList[productIndex].isAddToCart = false;
    }
    notifyListeners();
  }

  removeAddToCarts() {
    for (var id in addToCartList) {
      final productIndex = getProductIndex(id);
      productList[productIndex].isAddToCart = false;
    }
    resetAddToCartList();
    notifyListeners();
  }

  resetAddToCartList() {
    addToCartList.clear();
    addToCartListLength = 0;
    notifyListeners();
  }

  resetProductList() {
    productList.clear();
  }

  resetProvider() {
    resetAddToCartList();
    resetProductList();
  }
}
