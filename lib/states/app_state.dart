

import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isBusy;
  bool get isBusy => _isBusy;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  set setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
