import 'package:bookly/components/bottom_nav.dart';
import 'package:bookly/controllers/address_controller.dart';
import 'package:bookly/controllers/category_controller.dart';
import 'package:bookly/controllers/listing_controller.dart';
import 'package:bookly/controllers/top_nav_controller.dart';
import 'package:bookly/pages/categories_page.dart';
import 'package:bookly/pages/create_acct_page.dart';
import 'package:bookly/pages/homepage.dart';
import 'package:bookly/pages/landing_page.dart';
import 'package:bookly/pages/login.dart';
import 'package:bookly/pages/profile_page.dart';
import 'package:bookly/pages/search_page.dart';
import 'package:bookly/pages/selected_category_page.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //controller to control shared state of hamburger menu
  final menuController = TopNavController(); 
  final addrController = AddressController();
  final catController = CategoryController();
  final listingController = ListingController();
  
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      routes: {
        '/selected-category-page': (context) => SelectedCategoryPage(categoryController: catController, topNavController: menuController, listingController: listingController,),
        '/login': (context) => LoginPage(),
        '/landing': (context) => LandingPage(),
        '/createAcct': (context) => CreateAcctPage(),
        //since the bottom nav builds all the pages make hte home be the bottomnav so it builds the navigation system on login
        '/home': (context) => BottomNav(menuController: menuController, addrController: addrController, catController: catController, listingController: listingController,),
        '/search': (context) => SearchPage(),
        '/profile': (context) => ProfilePage(),
        
        // '/categories': (context) => CategoriesPage()
      },
    );
  }
}