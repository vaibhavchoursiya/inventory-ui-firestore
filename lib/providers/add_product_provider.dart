import 'package:flutter/material.dart';
import 'package:inventory_management_app/models/product_model.dart';
import 'package:inventory_management_app/services/firebase_firestore_service.dart';

class AddProductProvider extends ChangeNotifier {
  bool processLoader = false;

  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController totalQuantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  resetTextEditingController() {
    productNameController.clear();
    descriptionController.clear();
    totalQuantityController.clear();
    priceController.clear();
    imageUrlController.clear();
  }

  updateProcessLoader(value) {
    processLoader = value;
    notifyListeners();
  }

  addProduct() async {
    updateProcessLoader(true);
    final data = {
      "name": productNameController.text.trim(),
      "description": descriptionController.text.trim(),
      "totalQuantity": int.parse(totalQuantityController.text.trim()),
      "imageUrl": imageUrlController.text.trim(),
      "price": double.parse(priceController.text.trim()),
    };
    await FirebaseFirestoreService.addProduct(data);
  }
}
