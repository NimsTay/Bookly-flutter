import 'package:bookly/components/left_hamburger_menu.dart';
import 'package:bookly/controllers/address_controller.dart';
import 'package:bookly/controllers/top_nav_controller.dart';
import 'package:bookly/components/top_nav.dart';
import 'package:flutter/cupertino.dart';

class Homepage extends StatefulWidget {
  final TopNavController topNavController;
  final AddressController addrController;

  const Homepage({
    super.key,
    required this.topNavController,
    required this.addrController
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    //return stack and put the left side menu on top of nav bar but dont show until the notify listeners is called in controller
    return Stack(
      children: [
        CupertinoPageScaffold(
          navigationBar: TopNavWidget(pageTitle: "Bookly", menuController: widget.topNavController),
          child: Center(child:Text("HEllow oreld"))
        ),
        LeftHamburgerMenu(menuController: widget.topNavController, addressController: widget.addrController,)
      ],
    ); 
  }
}