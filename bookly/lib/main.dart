import 'package:bookly/components/bottom_nav.dart';
import 'package:bookly/pages/categories_page.dart';
import 'package:bookly/pages/create_acct_page.dart';
import 'package:bookly/pages/homepage.dart';
import 'package:bookly/pages/landing_page.dart';
import 'package:bookly/pages/login.dart';
import 'package:bookly/pages/profile_page.dart';
import 'package:bookly/pages/search_page.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/landing': (context) => LandingPage(),
        '/createAcct': (context) => CreateAcctPage(),
        //since the bottom nav builds all the pages make hte home be the bottomnav so it builds the navigation system on login
        '/home': (context) => BottomNav(),
        '/search': (context) => SearchPage(),
        '/profile': (context) => ProfilePage(),
        // '/categories': (context) => CategoriesPage()
      },
    );
  }
}