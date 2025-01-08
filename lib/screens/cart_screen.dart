import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';
import 'package:inventory_management_app/providers/cart_provider.dart';
import 'package:inventory_management_app/widgets/cart_view.dart';
import 'package:inventory_management_app/widgets/shopping_form_widget.dart';
import 'package:inventory_management_app/widgets/simple_navbar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final List ids;
  const CartScreen({super.key, required this.ids});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initializeFunc();
    });
  }

  Future<void> initializeFunc() async {
    final cartProvider = context.read<CartProvider>();
    await cartProvider.initializeOrderList(widget.ids);
  }

  @override
  Widget build(BuildContext context) {
    final initialLoader = context
        .select<CartProvider, bool>((provider) => provider.initialLoader);
    final processLoader = context
        .select<CartProvider, bool>((provider) => provider.processLoader);
    final totalPrice =
        context.select<CartProvider, double>((provider) => provider.totalPrice);
    const border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        if (!initialLoader && !processLoader) {
          context.read<CartProvider>().resetProvider();
          context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Apptheme.light,
        // appBar: AppBar(
        //   backgroundColor: Apptheme.light,
        //   leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.arrow_back_ios_outlined,
        //       color: Apptheme.dark,
        //     ),
        //   ),
        //   centerTitle: true,
        //   title: Text(
        //     "Your cart",
        //     style: GoogleFonts.aDLaMDisplay(
        //       fontSize: 19.0,
        //       fontWeight: FontWeight.w600,
        //       color: Apptheme.dark,
        //       height: 1.2,
        //     ),
        //   ),
        // ),
        body: initialLoader
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SimpleNavBar(
                              initialLoader: initialLoader,
                              processLoader: processLoader,
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            const CartView(),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TotolCostWidget(totalPrice: totalPrice),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Form",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            const ShoppingFormWidget(border: border),
                          ],
                        ),
                      ),
                      if (processLoader) ...[
                        const Positioned.fill(child: ModalBarrier()),
                        const Positioned.fill(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class TotolCostWidget extends StatelessWidget {
  const TotolCostWidget({
    super.key,
    required this.totalPrice,
  });

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Apptheme.primary),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0),
            ),
          ),
          child: Text(
            "Totat",
            style: GoogleFonts.roboto(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Apptheme.primary.withOpacity(0.7),
            border: Border.all(color: Apptheme.primary),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
          ),
          child: Text(
            totalPrice.toStringAsFixed(2),
            style: GoogleFonts.aDLaMDisplay(color: Apptheme.light),
          ),
        ),
      ],
    );
  }
}
