import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';
import 'package:inventory_management_app/providers/cart_provider.dart';
import 'package:inventory_management_app/widgets/cart_view.dart';
import 'package:inventory_management_app/widgets/navbar_widget.dart';
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

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        if (!initialLoader) {
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
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      SimpleNavBar(initialLoader: initialLoader),
                      Expanded(
                        child: CartView(),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
