import 'package:flutter/material.dart';
import 'package:inventory_management_app/providers/home_provider.dart';
import 'package:inventory_management_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = context.read<HomeProvider>().productList;

    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          // final product = productList[index];
          return ProductCard(
            index: index,
          );
        });
  }
}
