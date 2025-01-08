import 'package:cloud_firestore/cloud_firestore.dart';

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
    final document = products.doc(id).get();
    return document;
  }
}
