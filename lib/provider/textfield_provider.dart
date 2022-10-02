import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier {
  bool _enabled = true;
  String _text = "";

  bool get enabled => _enabled;

  void setEnabled(bool value) {
    _enabled = value;
    notifyListeners();
  }

  void setText(String text) {
    _text = text;
    notifyListeners();
  }

}