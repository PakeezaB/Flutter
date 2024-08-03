// model/counter_model.dart
class CounterModel {
//Contains the business logic for counting
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
  }
}
