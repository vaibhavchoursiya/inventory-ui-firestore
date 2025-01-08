import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';
import 'package:inventory_management_app/providers/cart_provider.dart';
import 'package:inventory_management_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class SimpleNavBar extends StatelessWidget {
  const SimpleNavBar({
    super.key,
    required this.initialLoader,
    required this.processLoader,
  });

  final bool initialLoader;
  final bool processLoader;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (!initialLoader && !processLoader) {
                  context.read<CartProvider>().resetProvider();
                  context.pop();
                }
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Apptheme.dark.withOpacity(0.8),
                size: 26.0,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              "Your cart 🛍️",
              style: GoogleFonts.aDLaMDisplay(
                fontSize: 19.0,
                color: Apptheme.dark.withOpacity(0.8),
                height: 1.2,
              ),
            ),
          ],
        ),
        IconButton(
            onPressed: () {
              context.read<HomeProvider>().removeAddToCarts();
              context.read<CartProvider>().resetProvider();
              context.pop();
            },
            icon: const Icon(Icons.delete))
      ],
    );
  }
}
