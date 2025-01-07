import 'package:flutter/material.dart';

class CardImageSection extends StatelessWidget {
  const CardImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6.0),
            topRight: Radius.circular(6.0),
          ),
          child: Image.network(
            "https://www.katyayaniorganics.com/wp-content/uploads/2022/09/PROM.png",
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const SizedBox(
                height: 150.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
        // Positioned(
        //   child: Container(
        //     padding: const EdgeInsets.all(6.0),
        //     decoration: const BoxDecoration(
        //       color: Apptheme.dark,
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(10.0),
        //       ),
        //     ),
        //     child: Text(
        //       "sale",
        //       style: GoogleFonts.roboto(
        //         color: Apptheme.light,
        //         fontSize: 16.0,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
