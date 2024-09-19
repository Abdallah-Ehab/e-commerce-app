import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreenFirst extends StatelessWidget {
  final PageController pageController;
  const OnBoardingScreenFirst({super.key,required this.pageController});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/fruits1.png"),
                    
                    const SizedBox(height: 10),

                    SvgPicture.asset("assets/images/shadow.svg"),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Get The Freshest Fruit Salad Combo",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We deliver the best and freshest fruit salad"
                      "in town. Order for a combo today!!!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          goToNextPage(context);
                        },
                        child: Text(
                          "Let’s Continue",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void goToNextPage(BuildContext context) {
  pageController.nextPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  );
}
}