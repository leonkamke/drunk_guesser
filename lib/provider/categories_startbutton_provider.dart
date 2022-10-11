import 'package:flutter/material.dart';

class StartButtonProvider with ChangeNotifier {
  bool _disabled = true;

  bool get disabled => _disabled;

  void setEnabled(bool value) {
    _disabled = value;
    notifyListeners();
  }

}