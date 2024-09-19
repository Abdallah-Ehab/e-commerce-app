import 'package:flutter/material.dart';

class CustomElevatedButtonTheme{
  CustomElevatedButtonTheme._();

  static ElevatedButtonThemeData customElevatedButtonTheme = ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(255, 164, 81, 1),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))
  );
}