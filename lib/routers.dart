import 'package:amazon_flutter_clone/screens/auth/auth_screen.dart';
import 'package:amazon_flutter_clone/screens/errors/page_not_found.dart';
import 'package:amazon_flutter_clone/screens/home_screen.dart';
import 'package:amazon_flutter_clone/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const BottomBar());
    default:
      return MaterialPageRoute(builder: (_) => const PageNotFound());
  }
}
