import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/models/order_model.dart';
import 'package:inventory_management_app/models/product_model.dart';

class FirebaseFirestoreService {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final CollectionReference products = firestore.collection("products");
  static final CollectionReference orders = firestore.collection("orders");

  static Stream<QuerySnapshot> getProductStream() {
    final snapshot = products.snapshots();
    return snapshot;
  }

  static Future getProducts() async {
    final snapshot = await products.get();
    final finalData = snapshot.docs.map((doc) => doc.data()).toList();
    return finalData;
  }

  static Future getDocumentById(String id) async {
    final document = await products.doc(id).get();
    return document.data();
  }

  static Future<void> addProduct(ProductModel model) async {
    await products.add(model.toMap());
  }

  static Future<void> updateProductById(String id, ProductModel model) async {
    final product = await getDocumentById(id);
    final data = {
      "name": model.name,
      "description": model.description,
      "totalQuantity": product["totalQuantity"] - model.totalQuantity,
      "price": model.price
    };

    await products.doc(id).update(data);
  }

  // {
  //"orderList": [{}, {},{}],
  //"clint name" : "",
  //"clint contact": "",
  //"total price": ""
  // }
  static Future<void> addOrder(List<OrderModel> items, String clientName,
      String clientContactInfo, double totalPrice) async {
    final data = {
      "clientName": clientName,
      "clientContactInfo": clientContactInfo,
      "totalPrice": totalPrice
    };
    List orderList = [];
    for (var item in items) {
      orderList.add(item.toMap());
    }
    data["orderList"] = orderList;

    await orders.add(data);
  }

  static Stream<QuerySnapshot> orderStream() {
    final snapshot = orders.snapshots();
    return snapshot;
  }
}
