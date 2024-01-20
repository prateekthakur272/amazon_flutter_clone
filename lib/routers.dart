import 'package:amazon_flutter_clone/screens/auth/auth_screen.dart';
import 'package:amazon_flutter_clone/screens/errors/page_not_found.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const AuthScreen());
    default:
      return MaterialPageRoute(builder: (_) => const PageNotFound());
  }
}
