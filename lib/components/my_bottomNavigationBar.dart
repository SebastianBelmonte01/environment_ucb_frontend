import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';

class myBottomNavigationBar extends StatelessWidget {
  final List<BottomNavItem> items;
  final int currentIndex;
  const myBottomNavigationBar(
      {super.key, required this.items, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppTheme.secondary,
      currentIndex: currentIndex,
      items: items
          .map((item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
              backgroundColor: AppTheme.secondary))
          .toList(),
      onTap: (index) {
        Navigator.pushReplacementNamed(context, items[index].route);
      },
      selectedItemColor: Colors.yellowAccent,
    );
  }
}
