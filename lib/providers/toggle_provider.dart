import 'package:flutter/material.dart';

class ToggleProvider with ChangeNotifier {
  bool isExpanded = true;

  void toggle() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}
