import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';
import 'package:inventory_management_app/widgets/card_icon_widget.dart';
import 'package:inventory_management_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class NavBarWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final scaffoldKey;
  const NavBarWidget({
    super.key,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    final addToCartListLength = context
        .select<HomeProvider, int>((provider) => provider.addToCartListLength);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                FontAwesomeIcons.bars,
                color: Apptheme.dark.withOpacity(0.7),
              ),
            ),
            const SizedBox(
              width: 3.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi Wilson 👋",
                  style: GoogleFonts.aDLaMDisplay(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                    color: Apptheme.dark,
                    height: 1.2,
                  ),
                ),
                Text(
                  "Enjoy our services!",
                  style: GoogleFonts.roboto(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w700,
                    color: Apptheme.dark.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            context.pushNamed("/cart",
                extra: context.read<HomeProvider>().addToCartList);
          },
          icon: cardIconWidget(context, addToCartListLength),
        ),
      ],
    );
  }
}
