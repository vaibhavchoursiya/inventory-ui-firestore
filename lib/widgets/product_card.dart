import 'package:flutter/material.dart';
import 'package:inventory_management_app/apptheme.dart';
import 'package:inventory_management_app/widgets/card_body.dart';
import 'package:inventory_management_app/widgets/card_image_section.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(18.0),
      child: Card(
        elevation: 2.0,
        color: Apptheme.light,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardImageSection(),
            CardBody(),
          ],
        ),
      ),
    );
  }
}
