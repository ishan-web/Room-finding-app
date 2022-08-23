import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  getDate(String data) {
    if (data.contains("yyyy-MM-dd")) {
      data.indexOf("yyyy-MM-dd");
      notifyListeners();
    }
    return data.substring(0, 10);
  }
}
