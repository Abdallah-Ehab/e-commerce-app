import 'package:flutter/material.dart';

class IncrementAndDecrement extends StatefulWidget {
  const IncrementAndDecrement({super.key});

  @override
  State<IncrementAndDecrement> createState() => _IncrementAndDecrementState();
}

class _IncrementAndDecrementState extends State<IncrementAndDecrement> {
  int amount = 0;

  void increment(){
    setState(() {
      amount+=1;
    });
  }
  void decremenet(){
    setState(() {
      if(amount>0){

      amount-=1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(onPressed: decremenet,icon:Icon(Icons.remove_circle_outline,size: 50,)),
          Text("$amount",style: TextStyle(fontSize: 20),),
          IconButton(onPressed: increment, icon: Icon(Icons.add_circle,color: Colors.orangeAccent,size: 50,))
        ],
      ),
    );
  }
}