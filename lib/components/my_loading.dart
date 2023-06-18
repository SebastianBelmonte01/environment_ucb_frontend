import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_shimmerSCard.dart';
import 'package:flutter/material.dart';

class myLoadingPage extends StatelessWidget {
  final String text;
  final int index;
  final List<BottomNavItem> bottomNavItems;
  const myLoadingPage(
      {required this.text,
      super.key,
      required this.index,
      required this.bottomNavItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(fontSize: 25, text: text, textcolor: Colors.white),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyShimmerSpecialCard(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.28,
          ),
        ),
      ),
      bottomNavigationBar:
          myBottomNavigationBar(items: bottomNavItems, currentIndex: 0),
    );
  }
}
