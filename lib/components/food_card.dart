import 'package:e_commerce_app/models/food.dart';
import 'package:e_commerce_app/screens/food_description.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final void Function() addToCart;
  final Color color;
  const FoodCard({super.key,required this.food,required this.addToCart,required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{Navigator.push(context, MaterialPageRoute(builder: (_)=> FoodDescription(food: food,)))},
      child: Container(
        width: 200,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset(food.image,fit: BoxFit.cover,),
                Positioned(
                  right: 10,
                  top: 10,
                  child: food.isFavourite ? Icon(Icons.favorite_outline,color: Theme.of(context).colorScheme.primary,):Icon(Icons.favorite_outlined,color: Theme.of(context).colorScheme.primary,)
                  )
                  ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Column(
                children: [
                  Text(food.name,style:Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("\$${food.price}",style:Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  )),
                ),
                IconButton(onPressed: addToCart, icon: Icon(Icons.add_circle,color: Theme.of(context).colorScheme.primary,))
              ],)
                ],
                
              ),
            ),
            
            ],
        ),
        ),
    );
  }
}