import 'package:flutter/material.dart';
import 'package:inventory_management_app/apptheme.dart';

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final Function tap;
  final Color color;
  const QuantityButton({
    super.key,
    required this.icon,
    required this.tap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: () {
    //     tap();
    //   },
    //   child: Container(
    //     padding: const EdgeInsets.all(4.0),
    //     decoration: BoxDecoration(
    //       color: color,
    //       borderRadius: BorderRadius.circular(5.0),
    //     ),
    //     child: Icon(
    //       icon,
    //       color: Apptheme.light,
    //       size: 14.0,
    //     ),
    //   ),
    // );

    return MaterialButton(
      minWidth: 5.0,
      height: 25.0,
      onPressed: () {
        tap();
      },
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      child: Icon(
        icon,
        color: Apptheme.light,
        size: 14.0,
      ),
    );
  }
}
