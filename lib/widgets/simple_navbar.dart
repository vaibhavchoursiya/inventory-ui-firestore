import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';

class SimpleNavBar extends StatelessWidget {
  const SimpleNavBar({
    super.key,
    required this.initialLoader,
  });

  final bool initialLoader;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (!initialLoader) {
              context.pop();
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Apptheme.dark,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          "Your cart",
          style: GoogleFonts.aDLaMDisplay(
            fontSize: 19.0,
            fontWeight: FontWeight.w600,
            color: Apptheme.dark,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
