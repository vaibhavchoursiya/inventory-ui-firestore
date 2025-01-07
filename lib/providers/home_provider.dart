import 'package:flutter/material.dart';
import 'package:inventory_management_app/models/product_model.dart';

class HomeProvider extends ChangeNotifier {
  int itemCount = 0;
  List<ProductModel> productItems = [];

  increaseItemCount() {
    itemCount += 1;
  }
}
