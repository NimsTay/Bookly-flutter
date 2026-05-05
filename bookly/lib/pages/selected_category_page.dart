import 'package:bookly/components/listing_tile.dart';
import 'package:bookly/components/top_nav.dart';
import 'package:bookly/controllers/category_controller.dart';
import 'package:bookly/controllers/listing_controller.dart';
import 'package:bookly/controllers/top_nav_controller.dart';
import 'package:bookly/models/listing_model.dart';
import 'package:flutter/cupertino.dart';

class SelectedCategoryPage extends StatefulWidget {
  
  final CategoryController categoryController;
  final ListingController listingController;
  final TopNavController topNavController;
  const SelectedCategoryPage({
    super.key,
    required this.categoryController,
    required this.topNavController,
    required this.listingController
  });



  @override
  State<SelectedCategoryPage> createState() => _SelectedCategoryPageState();
}

class _SelectedCategoryPageState extends State<SelectedCategoryPage> {
  List<ListingModel>? categoryListings;

  @override
  void initState() {
    super.initState();
    categoryListings = widget.listingController.getListings(widget.categoryController.activeCategory);
    if(categoryListings == null) {
      throw Exception("No listings were found for the category ${widget.categoryController.activeCategory}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: TopNavWidget(pageTitle: widget.categoryController.activeCategory, menuController: widget.topNavController),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: categoryListings!.map((listing){
              return Expanded(child: ListingTile(listingObj: listing), flex: 1,);
            }).toList()
          )
        )
      )
    );
  }
}