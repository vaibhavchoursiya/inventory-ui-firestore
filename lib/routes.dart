import 'package:go_router/go_router.dart';
import 'package:inventory_management_app/screens/home_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(initialLocation: "/home", routes: [
    GoRoute(
      path: "/home",
      name: "/home",
      builder: (context, state) => const HomeScreen(),
    ),
  ]);
}
