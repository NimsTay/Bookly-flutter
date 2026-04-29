import 'package:bookly/pages/categories_page.dart';
import 'package:bookly/pages/homepage.dart';
import 'package:bookly/pages/profile_page.dart';
import 'package:bookly/pages/search_page.dart';
import 'package:bookly/theme/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  String getTitle(int index) {
    switch(index) {
      case 0: 
        return "Bookly";
      case 1: 
        return "Search";
      case 2: 
        return "Profile";
      case 3: 
        return "";
    }
    return "";
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 64,
        activeColor: ThemeColors.magenta,
        
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile'
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.option),
            label: 'Categories'
          ),
        ]
      ),
      //build each screen
      tabBuilder: (context, tabIndex) {
        switch(tabIndex) {
          case 0:
            return CupertinoTabView(
              builder: (context) => Homepage()
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => SearchPage()
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => ProfilePage()
            );
          case 3:
            return CupertinoTabView(
              builder: (context) => CategoriesPage()
            );
          default:
            return Container();
        }
      },
    );
  }
}