import 'package:flutter/material.dart';
import 'package:inventory_management_app/models/order_model.dart';
import 'package:inventory_management_app/services/firebase_firestore_service.dart';

class CartProvider extends ChangeNotifier {
  bool initialLoader = true;
  List<OrderModel> orderList = [];
  double totalPrice = 0.0;

  updateInitialLoader(bool value) {
    initialLoader = value;
    notifyListeners();
  }

  Future<void> initializeOrderList(List ids) async {
    orderList.clear();
    for (var id in ids) {
      final document = await FirebaseFirestoreService.getDocumentById(id);
      orderList.add(OrderModel.fromJson(document, id));
    }
    updateTotalPrice();
    updateInitialLoader(false);
  }

  updateTotalPrice() {
    totalPrice = 0.0;
    for (var item in orderList) {
      totalPrice += item.totalQuantity * item.price;
    }
  }

  incrementTotalQuantityByIndex(index) {
    orderList[index].add();
    updateTotalPrice();
    notifyListeners();
  }

  decrementTotalQuantityByIndex(index) {
    final res = orderList[index].remove();
    if (res) {
      updateTotalPrice();
      notifyListeners();
    }
  }

  resetInitialLoader() {
    initialLoader = true;
  }

  resetOrderList() {
    orderList.clear();
    totalPrice = 0.0;
  }

  resetProvider() {
    resetInitialLoader();
    resetOrderList();
  }
}
