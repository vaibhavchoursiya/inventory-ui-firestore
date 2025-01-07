import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Apptheme.dark.withOpacity(0.3), width: 0.5),
    );
    return SizedBox(
      height: 60.0,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search here...",
                filled: true,
                fillColor: Apptheme.primary.withOpacity(0.02),
                hintStyle: GoogleFonts.aDLaMDisplay(
                  color: Apptheme.dark.withOpacity(0.3),
                ),
                prefixIcon: Icon(
                  FontAwesomeIcons.search,
                  color: Apptheme.dark.withOpacity(0.3),
                ),
                border: border,
                focusedBorder: border,
                enabledBorder: border,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            width: 58.0,
            height: 53.0,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Apptheme.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            child: const Icon(
              FontAwesomeIcons.sliders,
              color: Apptheme.light,
            ),
          ),
        ],
      ),
    );
  }
}
