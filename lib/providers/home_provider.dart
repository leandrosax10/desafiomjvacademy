import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int index = 0;

  void setIndex(int currentIndex) {
    index = currentIndex;
    notifyListeners();
  }
}