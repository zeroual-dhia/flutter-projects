import 'package:flutter/material.dart';


class CatalogModel {
  static List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  Item getById(int id) => Item(id: id, name: itemNames[id % itemNames.length]);
  int get length => itemNames.length;
}

class Item {
  final String name;
  final int id;
  final Color color;
  final price = 42;

  Item({required this.id, required this.name})
      : color = Colors.primaries[id % Colors.primaries.length];
}
