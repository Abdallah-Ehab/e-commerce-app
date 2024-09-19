import 'package:e_commerce_app/theme/app_bar_theme.dart';
import 'package:e_commerce_app/theme/elevated_button_theme.dart';
import 'package:e_commerce_app/theme/text_field_theme.dart';
import 'package:e_commerce_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  ThemeManager._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    textTheme: CustomTextTheme.customTextTheme,
    inputDecorationTheme: CustomInputTheme.customInputTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.customElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.customAppBarTheme ,
    colorScheme: const ColorScheme.light(
      primary:  Color.fromRGBO(255, 164, 81, 1),
      onPrimary: Colors.white
    )
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    textTheme: CustomTextTheme.customTextTheme,
    inputDecorationTheme: CustomInputTheme.customInputTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.customElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.customAppBarTheme ,
    colorScheme: const ColorScheme.dark(
      primary: Colors.black,
      onPrimary: Colors.white
    )
  );

}
