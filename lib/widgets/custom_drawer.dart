import 'package:flutter/material.dart';
import 'package:inventory_management_app/apptheme.dart';

Widget customDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Apptheme.primary),
          child: Center(
            child: Icon(
              color: Apptheme.light,
              Icons.person,
              size: 64.0,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Add Products'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
