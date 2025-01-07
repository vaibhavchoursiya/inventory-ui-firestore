import 'package:flutter/material.dart';
import 'package:inventory_management_app/models/product_model.dart';

class HomeProvider extends ChangeNotifier {
  int itemCount = 0;
  List<ProductModel> addToCartList = [];

  increaseItemCount() {
    itemCount += 1;
  }

  decrementItemCount() {
    itemCount -= 1;
  }

  addToCard(ProductModel item) {
    if (!addToCartList.contains(item)) {
      addToCartList.add(item);
      increaseItemCount();
    } else {
      addToCartList.remove(item);
      decrementItemCount();
    }
    notifyListeners();
  }
}
