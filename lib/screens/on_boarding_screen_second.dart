import 'package:e_commerce_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreenSecond extends StatelessWidget {
  
  final TextEditingController controller = TextEditingController();
   OnBoardingScreenSecond({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isKeyBoardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(15),
              color: Theme.of(context).colorScheme.primary,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(!isKeyBoardOpen)

                  ...[Image.asset("assets/images/fruits2.png"),
                  const SizedBox(height: 10),
                  SvgPicture.asset("assets/images/shadow.svg"),]
                  
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "hello",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: const Color.fromRGBO(39, 33, 77, 1),
                    ),
                  ),
                  isKeyBoardOpen? const SizedBox():const SizedBox(height: 10),
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "your name",
                    ),
                  ),
                  isKeyBoardOpen? const SizedBox():const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){logIn(context);},
                      child: Text(
                        "Start Ordering",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void logIn(BuildContext context){
    if(controller.text.isNotEmpty){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage(name:controller.text)));
    }else{
      showDialog(context: context, builder:(ctx){
        return AlertDialog(
          title:const Text("Please enter your name"),
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: Text("ok",style: Theme.of(context).textTheme.headlineSmall,))
          ],
        );
      } );
    }
  }
}
