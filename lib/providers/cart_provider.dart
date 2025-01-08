import 'package:flutter/material.dart';
import 'package:inventory_management_app/models/order_model.dart';
import 'package:inventory_management_app/services/firebase_firestore_service.dart';

class CartProvider extends ChangeNotifier {
  bool initialLoader = true;
  bool processLoader = false;
  List<OrderModel> orderList = [];
  double totalPrice = 0.0;

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  updateInitialLoader(bool value) {
    initialLoader = value;
    notifyListeners();
  }

  updateProcessLoader(bool value) {
    processLoader = value;
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

  Future sendOrder() async {
    updateProcessLoader(true);
    final res = await FirebaseFirestoreService.addOrder(
        orderList, nameController.text, contactController.text, totalPrice);
    return res;
  }

  resetInitialLoader() {
    initialLoader = true;
  }

  resetOrderList() {
    orderList.clear();
    totalPrice = 0.0;
  }

  resetController() {
    nameController.clear();
    contactController.clear();
  }

  resetProvider() {
    resetInitialLoader();
    resetOrderList();
    resetController();
  }
}
