import 'package:bookly/controllers/address_controller.dart';
import 'package:bookly/controllers/category_controller.dart';
import 'package:bookly/controllers/listing_controller.dart';
import 'package:bookly/controllers/top_nav_controller.dart';
import 'package:bookly/pages/categories_page.dart';
import 'package:bookly/pages/homepage.dart';
import 'package:bookly/pages/profile_page.dart';
import 'package:bookly/pages/search_page.dart';
import 'package:bookly/theme/theme_colors.dart';
import 'package:flutter/cupertino.dart';

class BottomNav extends StatefulWidget {

  final TopNavController menuController;
  final AddressController addrController;
  final CategoryController catController;
  final ListingController listingController;

  const BottomNav({
    super.key,
    required this.menuController,
    required this.addrController,
    required this.catController,
    required this.listingController,
  });

  @override
  State<BottomNav> createState() => _BottomNavState();
}


class _BottomNavState extends State<BottomNav> {
  int activeTabIndex = 0;
  

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
              builder: (context) => Homepage(topNavController: widget.menuController, addrController: widget.addrController)
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => SearchPage()
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => CategoriesPage(topNavController: widget.menuController, addrController: widget.addrController, categoryController: widget.catController)
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