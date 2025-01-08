import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';

class CartBody extends StatelessWidget {
  final String name;
  final double price;
  const CartBody({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 5.0, top: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                color: Apptheme.dark.withOpacity(0.55),
                fontSize: 16.0,
                height: 1.2,
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
            Text(
              "rs.$price",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                color: Apptheme.dark.withOpacity(0.7),
                height: 1.2,
                fontSize: 17.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
