import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int itemCount = 0;

  increaseItemCount() {
    itemCount += 1;
  }
}
