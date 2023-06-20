import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    if (counter > 0) {
      counter--;
    }
    notifyListeners();
  }

  void reset() {
    counter = 0;
    notifyListeners();
  }
}
