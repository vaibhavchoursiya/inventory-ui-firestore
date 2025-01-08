import 'package:flutter/material.dart';
import 'package:inventory_management_app/models/order_model.dart';
import 'package:inventory_management_app/services/firebase_firestore_service.dart';

class CartProvider extends ChangeNotifier {
  bool initialLoader = true;
  List<OrderModel> orderList = [];

  updateInitialLoader(bool value) {
    initialLoader = value;
    notifyListeners();
  }

  Future<void> initializeOrderList(List ids) async {
    orderList.clear();
    for (var id in ids) {
      final document = await FirebaseFirestoreService.getDocumentById(id);
      orderList.add(OrderModel.fromJson(document));
    }
    updateInitialLoader(false);
  }
}
