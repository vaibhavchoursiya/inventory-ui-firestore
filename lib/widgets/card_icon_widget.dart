import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inventory_management_app/apptheme.dart';

Widget cardIconWidget(BuildContext context) {
  return Stack(
    children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          FontAwesomeIcons.cartShopping,
          color: Apptheme.primary,
          size: 28.0,
        ),
      ),
      Positioned(
        right: 0,
        top: 0,
        child: Container(
          width: 15.0,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(1.0),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
          child: const Text(
            "0",
            style: TextStyle(
              color: Apptheme.light,
              fontWeight: FontWeight.bold,
              fontSize: 10.0,
            ),
          ),
        ),
      ),
    ],
  );
}
