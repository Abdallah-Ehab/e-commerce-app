import 'package:flutter/material.dart';

class ThemeController with ChangeNotifier {
  ThemeController();

   ThemeMode themeMode = ThemeMode.light;

   toggleTheme(bool isDark){
    themeMode =  isDark? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); 
  }

  
}