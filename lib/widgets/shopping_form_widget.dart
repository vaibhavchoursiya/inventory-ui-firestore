import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';
import 'package:inventory_management_app/providers/cart_provider.dart';
import 'package:inventory_management_app/providers/home_provider.dart';
import 'package:inventory_management_app/utilites/validators.dart';
import 'package:inventory_management_app/widgets/mtext_form_field.dart';
import 'package:inventory_management_app/widgets/navbar_widget.dart';
import 'package:provider/provider.dart';

class ShoppingFormWidget extends StatefulWidget {
  const ShoppingFormWidget({
    super.key,
    required this.border,
  });

  final OutlineInputBorder border;

  @override
  State<ShoppingFormWidget> createState() => _ShoppingFormWidgetState();
}

class _ShoppingFormWidgetState extends State<ShoppingFormWidget> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          MTextFormFieldColumn(
            border: widget.border,
            hintText: "Enter name",
            controller: context.read<CartProvider>().nameController,
            validator: Validators.emptyValidator,
          ),
          MTextFormFieldColumn(
            border: widget.border,
            hintText: "Enter contact no",
            controller: context.read<CartProvider>().contactController,
            validator: Validators.phoneNumberValidator,
          ),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.send),
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  final cartProvider = context.read<CartProvider>();
                  final homeProvider = context.read<HomeProvider>();
                  final res = await cartProvider.sendOrder();
                  if (context.mounted) {
                    if (res["status"] == "failed") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Sorry we don't have that much stock."),
                        ),
                      );
                    }
                    cartProvider.resetProvider();
                    homeProvider.resetAddToCartList();
                    cartProvider.updateProcessLoader(false);
                    context.pop();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
                foregroundColor: Apptheme.light,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              label: Text(
                "Send Order",
                style: GoogleFonts.aDLaMDisplay(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
