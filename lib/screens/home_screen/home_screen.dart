import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/screens/home_screen/widgets/address_box.dart';
import 'package:amazon_flutter_clone/screens/home_screen/widgets/top_categories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Material(
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            hintText: 'Search Amazon.in',
                            prefixIcon: const InkWell(
                              child: Icon(Icons.search),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(8)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {},
                  iconSize: 28,
                ),
              ],
            ),
          )),
      body: const Column(
        children: [
          AddressBox(),
          TopCategories()
        ],
      ),
    );
  }
}
