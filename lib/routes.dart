import 'package:go_router/go_router.dart';
import 'package:inventory_management_app/screens/add_product.dart';
import 'package:inventory_management_app/screens/cart_screen.dart';
import 'package:inventory_management_app/screens/home_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(initialLocation: "/home", routes: [
    GoRoute(
      path: "/home",
      name: "/home",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/add_product",
      name: "/add_product",
      builder: (context, state) => const AddProduct(),
    ),
    GoRoute(
      path: "/cart",
      name: "/cart",
      builder: (context, state) {
        final ids = state.extra as List<String>;
        return CartScreen(ids: ids);
      },
    )
  ]);
}
