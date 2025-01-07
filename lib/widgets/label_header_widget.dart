import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';

class LabelHeaderWidget extends StatelessWidget {
  final String label;
  final Function function;
  const LabelHeaderWidget(
      {super.key, required this.label, required this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 20.0,
            color: Apptheme.dark,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "See All",
          style: GoogleFonts.roboto(
            color: Apptheme.primary,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
