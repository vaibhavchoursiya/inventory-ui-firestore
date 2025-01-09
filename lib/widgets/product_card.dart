import 'package:flutter/material.dart';
import 'package:inventory_management_app/apptheme.dart';
import 'package:inventory_management_app/providers/home_provider.dart';
import 'package:inventory_management_app/widgets/card_body.dart';
import 'package:inventory_management_app/widgets/card_image_section.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final int index;
  const ProductCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        elevation: 2.0,
        color: Apptheme.light,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardImageSection(
              imageUrl:
                  context.watch<HomeProvider>().productList[index].imageUrl,
            ),
            CardBody(
              productModel: context.watch<HomeProvider>().productList[index],
            ),
          ],
        ),
      ),
    );
  }
}
