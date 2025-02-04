import 'package:flutter/material.dart';

class MyModel extends ChangeNotifier {
  List<String> to_do = [];
  List<String> completed = [];
  List<String> searched = [];

  void add_todo(text) {
    to_do.add(text);
    searched.add(text);
    notifyListeners();
  }

  void finished(text) {
    completed.add(text);
    notifyListeners();
  }

  void delete(text) {
    to_do.remove(text);
    searched.remove((text));
    if (completed.contains(text)) {
      completed.remove(text);
    }
    notifyListeners();
  }

  void unfinished(text) {
    completed.remove(text);
    notifyListeners();
  }

  void search(String text) {
    if (text.isNotEmpty) {
      {
        RegExp regexp = RegExp(text,
            caseSensitive: false); // Optional: case insensitive search
        searched = to_do.where((item) => regexp.hasMatch(item)).toList();
      }
      notifyListeners(); // Notify listeners so they can react to the search result update
    }
  }
}
