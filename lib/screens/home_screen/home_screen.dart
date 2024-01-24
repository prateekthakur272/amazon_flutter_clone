import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded (
                  child: Container(
                    height: 48,
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(4),
                      
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_outlined)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                    ],
                  ),
                )
              ],
            ),
          )),
      body: Center(
        child: Text(user.toJson()),
      ),
    );
  }
}
