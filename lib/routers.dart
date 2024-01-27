import 'package:amazon_flutter_clone/screens/admin_screen/add_product.dart';
import 'package:amazon_flutter_clone/screens/auth/auth_screen.dart';
import 'package:amazon_flutter_clone/screens/errors/page_not_found.dart';
import 'package:amazon_flutter_clone/screens/home_screen/home_screen.dart';
import 'package:amazon_flutter_clone/widgets/navigator_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const HomeScreen());
    case NavigatorScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const NavigatorScreen());
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const AddProductScreen());
    default:
      return MaterialPageRoute(builder: (_) => const PageNotFound());
  }
}
