import 'package:flutter/material.dart';
import 'package:inventory_management_app/apptheme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVUK9zEzJFG318C6jZTDqR4R08nA2sg43pnA&s",
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const SizedBox(
            height: 200.0,
            child: Center(
              child: CircularProgressIndicator(
                color: Apptheme.primary,
              ),
            ),
          );
        },
        fit: BoxFit.cover,
        filterQuality: FilterQuality.medium,
        width: double.infinity,
        height: 200.0,
      ),
    );
  }
}
