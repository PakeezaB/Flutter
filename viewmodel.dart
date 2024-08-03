// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mvvm_example_app/model.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel _counterModel = CounterModel();

  int get count => _counterModel.count;

  void increment() {
    _counterModel.increment();
    notifyListeners();
  }
}
