import 'package:e_commerce_app/screens/splash_screen.dart';
import 'package:e_commerce_app/screens/test_scree.dart';
import 'package:e_commerce_app/theme/theme_controller.dart';
import 'package:e_commerce_app/theme/theme_manager.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  ThemeController themeController = ThemeController();



  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeController.themeMode ,
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      home: const SplashScreen()  
      );
  }
}