import 'package:bookly/components/category_button.dart';
import 'package:bookly/components/left_hamburger_menu.dart';
import 'package:bookly/components/top_nav.dart';
import 'package:bookly/controllers/address_controller.dart';
import 'package:bookly/controllers/category_controller.dart';
import 'package:bookly/controllers/top_nav_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  final TopNavController topNavController;
  final AddressController addrController;
  final CategoryController categoryController;

  const CategoriesPage({
    super.key,
    required this.addrController,
    required this.topNavController,
    required this.categoryController
  });

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoPageScaffold(
          navigationBar: TopNavWidget(pageTitle: "Categories", menuController: widget.topNavController),
          //make a safe area so all content avoid os ui like notch
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CupertinoSearchTextField(
                    onChanged: (value) {
                      widget.categoryController.searchForCategoryQuery(value);
                    },
                  ),
                ),
                //but the grid view in an expanded since column does not restrict heights of children so infinite height on grid view
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(15),
                    itemCount: widget.categoryController.allCategories.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent : 120, //max width of each item
                      crossAxisSpacing: 5,//horizontal pc gap between items
                      mainAxisSpacing: 8, //vertical space between rows
                    ),
                    itemBuilder: (context, index) {
                      final cat = widget.categoryController.allCategories[index];
                      return CategoryButtonComponent(
                        buttonLabel: cat,
                        categoryController: widget.categoryController
                      );
                    }
                  )
                )
              ],
            )
            
          )
        ),
        LeftHamburgerMenu(menuController: widget.topNavController, addressController: widget.addrController,)
      ]
    );
  }
}