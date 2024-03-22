import 'package:flutter/material.dart';

class TopBottomBarChangeNotifier extends ChangeNotifier {
  bool isVisible = true;

  void toggle() {
    isVisible = !isVisible;
    notifyListeners();
  }
}