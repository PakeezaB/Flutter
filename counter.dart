import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier //class that can be axchanged or mixed
//when the state changes, it notifies all its listeners

{
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
