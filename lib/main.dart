import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/providers/user_provider.dart';
import 'package:amazon_flutter_clone/routers.dart';
import 'package:amazon_flutter_clone/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> UserProvider())
      ],
      child: MaterialApp(
        title: 'Amazon',
        theme: ThemeData(
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder()
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(56),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              )
            )
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
          useMaterial3: false,
        ),
        home: const AuthScreen(),
        onGenerateRoute: (settings) => generateRoute(settings),
      ),
    );
  }
}
