import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  int _counter;

  MainViewModel({int counter = 0}) : this._counter = counter;

  int get counter => this._counter;
  set counter(int value) {
    this._counter = value;
    notifyListeners();
  }

  void increment() => this.counter += 1;
}