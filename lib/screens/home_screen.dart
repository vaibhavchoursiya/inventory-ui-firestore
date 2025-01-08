import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_app/apptheme.dart';
import 'package:inventory_management_app/providers/home_provider.dart';
import 'package:inventory_management_app/services/firebase_firestore_service.dart';
import 'package:inventory_management_app/widgets/custom_drawer.dart';
import 'package:inventory_management_app/widgets/hero_section.dart';
import 'package:inventory_management_app/widgets/label_header_widget.dart';
import 'package:inventory_management_app/widgets/navbar_widget.dart';
import 'package:inventory_management_app/widgets/product_view.dart';
import 'package:inventory_management_app/widgets/search_filter_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: customDrawer(context),
      backgroundColor: Apptheme.light,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                NavBarWidget(
                  scaffoldKey: scaffoldKey,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                const SearchFilterWidget(),
                const SizedBox(
                  height: 30.0,
                ),
                const HeroSection(),
                const SizedBox(
                  height: 30.0,
                ),
                LabelHeaderWidget(
                  label: "Featured Products",
                  function: () {},
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestoreService.getProductStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List productDocs = snapshot.data!.docs;
                        context
                            .read<HomeProvider>()
                            .intitalizeProductList(productDocs);
                        return const ProductView();
                      }
                      return const CircularProgressIndicator();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
