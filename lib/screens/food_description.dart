import 'package:e_commerce_app/components/go_back.dart';
import 'package:e_commerce_app/components/increment_and_decrement.dart';
import 'package:e_commerce_app/models/food.dart';
import 'package:flutter/material.dart';

class FoodDescription extends StatelessWidget {
  final Food food;
  const FoodDescription({super.key,required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.orangeAccent,
        child: Column(
          children: [Container(
            padding: EdgeInsets.all(50),
            child: Row(
              children: [
                  GoBackButton()
              ],
            ),
          ),
          Image.asset(food.image,height: 200,width: 200,),
          SizedBox(height: 20,),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                  ,color: Colors.white
                ),
              
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Text(food.name,style:Theme.of(context).textTheme.headlineLarge),

                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncrementAndDecrement(),
                        Padding(padding: EdgeInsets.all(15),child: Text("\$${food.price}",style:TextStyle(fontSize: 25),))
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey.shade300,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("One Pack contains:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                      Container(
                        height: 3,
                        width: 150,
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(height: 20,)
                      ,Text("Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",style: Theme.of(context).textTheme.headlineMedium,),
                      ],
                    ),
                  ),
                      Divider(
                    thickness: 2,
                    color: Colors.grey.shade300,
                  ),
                  Padding(padding: EdgeInsets.only(left:15),child: Text("If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make")),
                  SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_rounded,color: Colors.orangeAccent,size: 50,))
                      ,Container(
                        padding: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        width: 200,
                        child: ElevatedButton(onPressed: 
                        (){}, child: Text("Add to basket")),
                      )
                    ],
                  )
                ],
              ),
            ),
          )],
        ),
      ),   );
  }
}