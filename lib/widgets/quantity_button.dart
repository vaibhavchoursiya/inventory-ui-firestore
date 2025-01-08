import 'package:flutter/material.dart';
import 'package:inventory_management_app/apptheme.dart';

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final Function tap;
  const QuantityButton({
    super.key,
    required this.icon,
    required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tap();
      },
      child: Container(
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: Apptheme.primary,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Icon(
          icon,
          color: Apptheme.light,
          size: 14.0,
        ),
      ),
    );
  }
}
