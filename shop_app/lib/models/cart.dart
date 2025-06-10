import 'package:flutter/material.dart';

import 'catalog.dart';


class CartModel extends ChangeNotifier {
  int total_price = 0;
  List<Item> selectedItems = [];

  void addItem(Item item) {
    selectedItems.add(item);
    total_price += item.price;
    notifyListeners();
  }

  void removeItem(Item item) {
    selectedItems.remove(item);
    total_price -= item.price;
    notifyListeners();
  }
}
