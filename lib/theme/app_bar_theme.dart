import 'package:flutter/material.dart';

class CustomAppBarTheme{
  CustomAppBarTheme._();

  static AppBarTheme customAppBarTheme = const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color:  Color.fromRGBO(255, 164, 81, 1),
      )
    );
}