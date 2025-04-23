import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  late int _selected_index;
  NavigationProvider() {
    _selected_index = 0;
  }

  int get getIndex => _selected_index;

  void ChangePage(index) {
    _selected_index = index;
    notifyListeners();
  }
  
}
