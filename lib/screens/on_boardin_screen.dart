import 'package:e_commerce_app/screens/on_boarding_screen_first.dart';
import 'package:e_commerce_app/screens/on_boarding_screen_second.dart';
import 'package:flutter/material.dart';

class OnBoardinScreen extends StatefulWidget {
  const OnBoardinScreen({super.key});

  @override
  State<OnBoardinScreen> createState() => _OnBoardinScreenState();
}

class _OnBoardinScreenState extends State<OnBoardinScreen> {

  late PageController _controller;

  int? currentIndex = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        PageView(
          controller: _controller,
          onPageChanged: (int index)=>setState(() {
            currentIndex = index;
          }),
          children: [
         OnBoardingScreenFirst(pageController: _controller,),
         OnBoardingScreenSecond()
      ],
        ),
       Positioned(
        bottom: MediaQuery.of(context).size.height * 0.3,
        left: MediaQuery.of(context).size.width*0.5 - 30,
         child: Row(
            children: List.generate(2, (int index){
              return Container(
                margin: EdgeInsets.only(right: 10),
                height:5,
                width: index == currentIndex?20:10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.black
                ),
              );
            }),
          ),
       ),
      ]
      // controller: ,
      // onPageChanged: ,
      );
  }
}
