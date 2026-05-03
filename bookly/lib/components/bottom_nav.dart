import 'package:bookly/controllers/address_controller.dart';
import 'package:bookly/controllers/top_nav_controller.dart';
import 'package:bookly/pages/categories_page.dart';
import 'package:bookly/pages/homepage.dart';
import 'package:bookly/pages/profile_page.dart';
import 'package:bookly/pages/search_page.dart';
import 'package:bookly/theme/theme_colors.dart';
import 'package:flutter/cupertino.dart';

class BottomNav extends StatefulWidget {

  const BottomNav({super.key});
  @override
  State<BottomNav> createState() => _BottomNavState();
}


class _BottomNavState extends State<BottomNav> {
  int activeTabIndex = 0;
  //controller to control shared state of hamburger menu
  final menuController = TopNavController(); 
  final addrController = AddressController();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 64,
        activeColor: ThemeColors.coral,
        //set the currentIndex based on the class field
        currentIndex: activeTabIndex,
        onTap: (index) {
          setState(() {
            activeTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: activeTabIndex == 0 ? ThemeColors.coral : ThemeColors.magenta,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.search,
              color: activeTabIndex == 1 ? ThemeColors.coral : ThemeColors.magenta,
            ),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.option,
              color: activeTabIndex == 2 ? ThemeColors.coral : ThemeColors.magenta,
            ),
            label: 'Categories'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: activeTabIndex == 3 ? ThemeColors.coral : ThemeColors.magenta,
            ),
            label: 'Profile'
          ),
        ]
      ),
      //build each screen
      tabBuilder: (context, tabIndex) {
        switch(tabIndex) {
          case 0:
            return CupertinoTabView(
              builder: (context) => Homepage(topNavController: menuController, addrController: addrController)
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => SearchPage()
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => CategoriesPage()
            );
          case 3:
            return CupertinoTabView(
              builder: (context) => ProfilePage()
            );
          default:
             return Container();
        }
      },
    );
  }
}