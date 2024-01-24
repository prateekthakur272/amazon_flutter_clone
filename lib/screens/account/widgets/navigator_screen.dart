import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigatorScreen extends StatelessWidget {
  const NavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      child: Row(
        children: [
          RichText(
              text: TextSpan(
                  children: [
                TextSpan(
                    text: user.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
              ],
                  text: 'Hello, ',
                  style: const TextStyle(fontSize: 22, color: Colors.black))),
        ],
      ),
    );
  }
}
