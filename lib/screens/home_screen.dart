import 'package:flutter/material.dart';
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
          padding: EdgeInsets.all(28.0),
          child: Column(
            children: [
              NavBarWidget(),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
