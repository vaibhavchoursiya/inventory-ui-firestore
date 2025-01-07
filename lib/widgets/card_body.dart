import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Apptheme.primary.withOpacity(0.06),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Katyayani activated humic acid + Fulvic acid",
            style: GoogleFonts.roboto(
              color: Apptheme.dark.withOpacity(0.8),
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "It acts as a natural Chelator (by providing a high cationic exchange capacity) to improve the uptake of minerals, nutrients, and trace elements by plants Direction of use Field-tested on Crops such as Rice, wheat, sugarcane, orchards, cotton chilies, banana, soybean, groundnut, vegetables, fruits,",
            style: GoogleFonts.roboto(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              const Chip(
                color:
                    WidgetStatePropertyAll(Color.fromARGB(255, 67, 224, 138)),
                label: Text(
                  "₹3000.0",
                  style: TextStyle(
                    color: Apptheme.light,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: SizedBox(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      "add to cart",
                      style: GoogleFonts.aDLaMDisplay(),
                    ),
                    icon: const Icon(FontAwesomeIcons.cartShopping),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Apptheme.light,
                      foregroundColor: Apptheme.dark,
                      side: const BorderSide(
                        color: Apptheme.dark,
                        width: 0.8,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
