import 'package:flutter/material.dart';
import 'package:inventory_management_app/providers/cart_provider.dart';
import 'package:inventory_management_app/widgets/cart_body_widget.dart';
import 'package:inventory_management_app/widgets/cart_quantity_buttons_widget.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: context.read<CartProvider>().orderList.length,
        itemBuilder: (context, index) {
          final order = context.read<CartProvider>().orderList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 18.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Row(children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                  ),
                  child: Image.network(
                    order.imageUrl,
                    width: 80,
                    height: 80.0,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ),
                CartBody(
                  name: order.name,
                  price: order.price,
                ),
                CartQuantityButtonsWidget(
                  totalQuantity: context
                      .watch<CartProvider>()
                      .orderList[index]
                      .totalQuantity,
                  index: index,
                ),
              ]),
            ),
          );
        });
  }
}
