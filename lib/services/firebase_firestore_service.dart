import 'package:cloud_firestore/cloud_firestore.dart';
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

  static Future<void> addProduct(data) async {
    await products.add(data);
  }

  static Future<void> updateProductById(String id, data) async {
    // final product = await getDocumentById(id);
    // final data = {
    //   "name": model.name,
    //   "description": model.description,
    //   "totalQuantity": product["totalQuantity"] - model.totalQuantity,
    //   "price": model.price
    // };

    await products.doc(id).update(data);
  }

  // {
  //"orderList": [{}, {},{}],
  //"clint name" : "",
  //"clint contact": "",
  //"total price": ""
  // }
  static Future addOrder(List<OrderModel> items, String clientName,
      String clientContactInfo, double totalPrice) async {
    final data = {
      "clientName": clientName,
      "clientContactInfo": clientContactInfo,
      "totalPrice": totalPrice
    };
    List orderList = [];
    for (var item in items) {
      final existingProduct = await getDocumentById(item.id);

      if (existingProduct["totalQuantity"] - item.totalQuantity < 0) {
        return {"status": "failed"};
      } else {
        orderList.add(item.toMap());

        final updatedProduct = {
          "name": item.name,
          "description": item.description,
          "totalQuantity":
              existingProduct["totalQuantity"] - item.totalQuantity,
          "price": item.price,
        };

        await updateProductById(item.id, updatedProduct);
      }
    }
    data["orderList"] = orderList;

    await orders.add(data);
    return {"status": "success"};
  }

  static Stream<QuerySnapshot> orderStream() {
    final snapshot = orders.snapshots();
    return snapshot;
  }
}
