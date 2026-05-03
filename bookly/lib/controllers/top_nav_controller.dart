import 'package:flutter/cupertino.dart';

class TopNavController extends ChangeNotifier {
  bool _isOpen = false;
  bool get isOpen => _isOpen;

  void open() {
    _isOpen = true;
    notifyListeners();
  }

  void close() {
    this._isOpen = false;
    notifyListeners();
  }

  void toggle() {
    this._isOpen = !this.isOpen;
    notifyListeners();
  }
}