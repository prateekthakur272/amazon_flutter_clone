import 'package:amazon_flutter_clone/constants/constants.dart';
import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/widgets/account/action_buttons.dart';
import 'package:amazon_flutter_clone/widgets/account/navigator_screen.dart';
import 'package:amazon_flutter_clone/widgets/account/orders.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/amazon_in.png', height: 45, width: 120, color: Colors.black,),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined)),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
                    ],
                  ),
                )
              ],
            ),
            backgroundColor: Colors.black,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient
              ),
            ),
          ),
        ),
        body: const Column(
          children: [
            NavigatorScreen(),
            space8,
            ActionButtons(),
            Orders(),

          ],
        ),
    );
  }
}
