import 'dart:developer';

import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/providers/user_provider.dart';
import 'package:amazon_flutter_clone/routers.dart';
import 'package:amazon_flutter_clone/screens/admin_screen/admin_screen.dart';
import 'package:amazon_flutter_clone/screens/auth/auth_screen.dart';
import 'package:amazon_flutter_clone/services/auth_service.dart';
import 'package:amazon_flutter_clone/widgets/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  _initUser() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('x-auth-token') ?? '';
    AuthService.getUser(token).then((user) {
      Provider.of<UserProvider>(context, listen: false).user = user;
    }).catchError((e){
      log(e.message);
    });
  }

  @override
  void initState() {
    super.initState();
    _initUser();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return MaterialApp(
      title: 'Amazon',
      theme: ThemeData(
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        inputDecorationTheme:
            const InputDecorationTheme(border: OutlineInputBorder()),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ))),
        appBarTheme: const AppBarTheme(
            elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        useMaterial3: false,
      ),
      home: user.token.isNotEmpty
          ? user.type == 'user'
              ? const NavigatorScreen()
              : const AdminScreen()
          : const AuthScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
