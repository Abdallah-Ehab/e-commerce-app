import 'package:e_commerce_app/models/food.dart';
import 'package:flutter/material.dart';

List<List<Food>> products = [
  // Fruit Salads
  [
    Food(name: "Tropical Fruit Salad", price: 12.00, isFavourite: false, image: "assets/images/food1.png"),
    Food(name: "Berry Medley Salad", price: 10.00, isFavourite: true, image: "assets/images/food2.png"),
    Food(name: "Citrus Delight Salad", price: 9.00, isFavourite: false, image: "assets/images/food3.png"),
    Food(name: "Mixed Berry Quinoa Salad", price: 13.50, isFavourite: true, image: "assets/images/food2.png"),
    Food(name: "Melon Mint Salad", price: 8.50, isFavourite: false, image: "assets/images/food1.png"),
  ],
  // Smoothies
  [
    Food(name: "Mango Pineapple Smoothie", price: 6.00, isFavourite: false, image: "assets/images/food1.png"),
    Food(name: "Strawberry Banana Smoothie", price: 5.50, isFavourite: true, image: "assets/images/food2.png"),
    Food(name: "Blueberry Spinach Smoothie", price: 7.00, isFavourite: false, image: "assets/images/food3.png"),
    Food(name: "Avocado Kiwi Smoothie", price: 7.50, isFavourite: true, image: "assets/images/food4.png"),
    Food(name: "Peach Raspberry Smoothie", price: 6.50, isFavourite: false, image: "assets/images/food5.png"),
  ],
  // Fruit Bowls
  [
    Food(name: "Acai Berry Bowl", price: 9.50, isFavourite: false, image: "assets/images/food1.png"),
    Food(name: "Dragon Fruit Bowl", price: 10.00, isFavourite: true, image: "assets/images/food2.png"),
    Food(name: "Mango Chia Bowl", price: 8.00, isFavourite: false, image: "assets/images/food3.png"),
    Food(name: "Tropical Bliss Bowl", price: 11.00, isFavourite: true, image: "assets/images/food4.png"),
    Food(name: "Peach Yogurt Bowl", price: 7.50, isFavourite: false, image: "assets/images/food5.png"),
  ],
];

