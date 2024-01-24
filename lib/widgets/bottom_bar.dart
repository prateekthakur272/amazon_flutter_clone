import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/screens/account/account_screen.dart';
import 'package:amazon_flutter_clone/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const routeName = '/bottom-bar';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageIndex = 0;
  final double _bottomBarWidth = 42;
  final double _bottomBarBorderWidth = 5;

  final pages = [
    const HomeScreen(),
    const AccountScreen(),
    Container(
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_pageIndex],
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
                child: const Icon(Icons.person_outline_outlined),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: badges.Badge(
                badgeContent: const Text('3'),
                badgeStyle: const badges.BadgeStyle(badgeColor: Colors.white),
                child: Container(
                  width: _bottomBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: _pageIndex == 2
                                  ? GlobalVariables.selectedNavBarColor
                                  : Colors.transparent,
                              width: _bottomBarBorderWidth))),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              )),
        ],
      ),
    );
  }
}
