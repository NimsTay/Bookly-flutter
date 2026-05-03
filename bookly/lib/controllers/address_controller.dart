import 'package:flutter/cupertino.dart';

class AddressController extends ChangeNotifier {

  String _currentAddress = "123 Avenue, 37130";
  final List<String> _savedAddresses = [];

  String get currentAddress => _currentAddress;

  void setCurrentAddress(String addr) {
    _currentAddress = addr;
    notifyListeners();
  }

  void AddToSavedAddresses(String addr) {
    if(_savedAddresses.length >= 3) {
      throw Exception("There are already 3 saved addresses and another was tried to be added");
    }
    _savedAddresses.add(addr);
    notifyListeners();
  }

  void RemoveFromSavedAddresses({String? addr, int? index}) {
    if(addr == null && index == null)
      throw Exception("the address and index were both null when trying to remove a saved address");
    if(_savedAddresses.length <= 0) {
      throw Exception("There are no saved addresses to remove from and another was tried to be removed");
    }
    if(index != null && (index < 0 || index >= _savedAddresses.length)) {
      throw Exception("Invalid index when trying to remove from saved addresses");
    }
    if(addr != null && !_savedAddresses.contains(addr.trim()))
      throw Exception("Invalid address when trying to remove from saved addresses");
      
    if (index != null) {
      _savedAddresses.removeAt(index);
      notifyListeners();
    }
    else if (addr != null) {
      _savedAddresses.remove(addr);
    }
  }
}