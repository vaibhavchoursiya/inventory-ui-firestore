import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management_app/apptheme.dart';
import 'package:inventory_management_app/widgets/navbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Apptheme.light,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            NavBarWidget(),
          ],
        ),
      )),
    );
  }
}
