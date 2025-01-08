import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';
import 'package:inventory_management_app/models/product_model.dart';
import 'package:inventory_management_app/providers/home_provider.dart';
import 'package:inventory_management_app/widgets/product_view.dart';
import 'package:provider/provider.dart';

class CardBody extends StatelessWidget {
  final ProductModel productModel;
  const CardBody({
    super.key,
    required this.productModel,
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
            productModel.name,
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
            productModel.description,
            style: GoogleFonts.roboto(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Chip(
                color: const WidgetStatePropertyAll(
                    Color.fromARGB(255, 67, 224, 138)),
                label: Text(
                  "₹${productModel.price}",
                  style: const TextStyle(
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
                    onPressed: () {
                      context.read<HomeProvider>().addToCart(productModel.id);
                    },
                    label: Text(
                      productModel.isAddToCart
                          ? "added to cart"
                          : "add to cart",
                      style: GoogleFonts.aDLaMDisplay(),
                    ),
                    icon: const Icon(FontAwesomeIcons.cartShopping),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: productModel.isAddToCart
                          ? Apptheme.primary
                          : Apptheme.light,
                      foregroundColor: productModel.isAddToCart
                          ? Apptheme.light
                          : Apptheme.dark,
                      side: productModel.isAddToCart
                          ? null
                          : const BorderSide(
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
