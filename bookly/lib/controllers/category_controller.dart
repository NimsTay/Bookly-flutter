import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryController extends ChangeNotifier {

  final List<String> _allInternalCategories = ["hello", "Massage", "Plumbing", "Tattoo", "yes"];
  List<String> _allDisplayCategories = ["hello", "Massage", "Plumbing", "Tattoo", "yes"];
  String _activeCategory = "";
  //TODO:Change these icons with custom icons
  final Map<String, IconData> _categoryIconMap = {
    "Tattoo": CupertinoIcons.pencil,
    "Plumbing": Icons.plumbing,
    "Massage": Icons.handshake,
    "hello": Icons.ac_unit_outlined, 
    "yes": Icons.access_alarms_rounded
  };

  String get activeCategory => _activeCategory;
  List<String> get allCategories => _allDisplayCategories;
  Map<String, IconData> get categoryIconMap => _categoryIconMap;


  void setActiveCategory(String cat) {
    _activeCategory = cat;
    notifyListeners();
  }

  List<String> searchForCategoryQuery(String searchedCat) {
    List<String> newDisplayCats = [];
    for (String cat in _allDisplayCategories) {
      if (cat.contains(searchedCat)) {
        newDisplayCats.add(cat);
      }
    }
    _allDisplayCategories = newDisplayCats;
    return _allDisplayCategories;
  }

  void addNewCategory(String cat){
    if (_allInternalCategories.contains(cat.toLowerCase())) {
      throw Exception("This category already exists and cannot be added to all cats");
    }
    _allInternalCategories.add(cat.toLowerCase());
    _allInternalCategories.sort();
    notifyListeners();
  }

  //getListingsInCategory()

}