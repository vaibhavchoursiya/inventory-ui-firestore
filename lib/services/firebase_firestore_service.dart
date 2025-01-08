import 'package:cloud_firestore/cloud_firestore.dart';
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
    return document;
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
}
