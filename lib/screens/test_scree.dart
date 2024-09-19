import 'dart:developer';

import 'package:e_commerce_app/components/food_tabs.dart';
import 'package:e_commerce_app/models/food.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  final List<Food> cart=[];
  void addToCart(Food food){
    setState(() {
      cart.add(food);
      log(cart.toString());
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodTabs(cart: cart,addToCart: addToCart,)
    );
  }
}