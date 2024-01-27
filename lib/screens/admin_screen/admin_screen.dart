import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/screens/admin_screen/posts_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _pageIndex = 0;
  final double _bottomBarWidth = 42;
  final double _bottomBarBorderWidth = 5;
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
                const Text('Admin', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
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
      body: const PostsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        iconSize: 28,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: _bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _pageIndex == 0
                                ? GlobalVariables.selectedNavBarColor
                                : Colors.transparent,
                            width: _bottomBarBorderWidth))),
                child: const Icon(Icons.home_outlined),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: _bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _pageIndex == 1
                                ? GlobalVariables.selectedNavBarColor
                                : Colors.transparent,
                            width: _bottomBarBorderWidth))),
                child: const Icon(Icons.analytics_outlined),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                  width: _bottomBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: _pageIndex == 2
                                  ? GlobalVariables.selectedNavBarColor
                                  : Colors.transparent,
                              width: _bottomBarBorderWidth))),
                  child: const Icon(Icons.all_inbox_outlined),
                ),
              ),
        ],
      ),
    );
  }
}