import 'package:flutter/foundation.dart';

class Counter extends ChangeNotifier {
  var _count = 0;
  int get getCounter {
    return _count;
  }

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }
}
