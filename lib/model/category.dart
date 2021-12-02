import 'package:flutter/foundation.dart';

class CategoryTab with ChangeNotifier{
  int _change = 0;

  int get change => _change;

  set change(int value) {
    _change = value;
    notifyListeners();
  }
}
