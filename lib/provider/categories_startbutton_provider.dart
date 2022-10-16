import 'package:flutter/material.dart';

class StartButtonProvider with ChangeNotifier {
  static bool buttonDisabled = true;

  bool get disabled => buttonDisabled;

  void setEnabled(bool value) {
    buttonDisabled = value;
    notifyListeners();
  }

}