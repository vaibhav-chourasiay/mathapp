import 'package:flutter/material.dart';

class Mythemechange with ChangeNotifier {
  static bool darktheme = false;

  ThemeMode get thememode {
    if (darktheme) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  changetheme() {
    darktheme = !darktheme;
    notifyListeners();
  }
}
