import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/providers/cart_provider.dart';
import 'package:inventory_management_app/widgets/quantity_button.dart';
import 'package:provider/provider.dart';

class CartQuantityButtonsWidget extends StatelessWidget {
  final int totalQuantity;
  final int index;
  const CartQuantityButtonsWidget({
    super.key,
    required this.totalQuantity,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          QuantityButton(
            icon: FontAwesomeIcons.plus,
            tap: () {
              context.read<CartProvider>().incrementTotalQuantityByIndex(index);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              "$totalQuantity",
              style: GoogleFonts.roboto(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          QuantityButton(
            icon: FontAwesomeIcons.minus,
            tap: () {
              context.read<CartProvider>().decrementTotalQuantityByIndex(index);
            },
          ),
        ],
      ),
    );
  }
}
