import 'package:flutter/material.dart';

class SwitchColorProvider with ChangeNotifier {
  bool _isOnOff = false;

  bool get isOnOff => _isOnOff;

  void switchOnOff() {
    _isOnOff = !_isOnOff;
    notifyListeners();
  }
}
