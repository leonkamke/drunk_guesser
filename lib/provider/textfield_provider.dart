import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier {
  bool _enabled = true;

  bool get enabled => _enabled;

  void setEnabled(bool value) {
    _enabled = value;
    notifyListeners();
  }

}