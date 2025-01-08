import 'package:flutter/material.dart';
import 'package:inventory_management_app/providers/cart_provider.dart';
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

    return Scaffold(
      body: initialLoader
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(),
    );
  }
}
