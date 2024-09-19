import 'package:flutter/material.dart';

class CustomTextTheme {
  CustomTextTheme._();

  static TextTheme customTextTheme = const TextTheme(
      headlineLarge:  TextStyle(
        fontFamily: "Brandon Grotesque",
        fontWeight: FontWeight.bold,
        fontSize: 24.0
      ),
      headlineMedium: TextStyle(
        fontFamily: "Brandon Grotesque",
        fontWeight: FontWeight.w600,
        fontSize: 18.0
      ),
      headlineSmall: TextStyle(
        fontFamily: "Brandon Grotesque", 
        fontWeight: FontWeight.normal,
        fontSize: 12.0
      )
    );


}