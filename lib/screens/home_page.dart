import 'package:e_commerce_app/components/food_card.dart';
import 'package:e_commerce_app/components/food_tabs.dart';
import 'package:e_commerce_app/models/food.dart';
import 'package:e_commerce_app/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Food> listOfFood = [
    Food(name: "Honey lime combo", price: 2000, isFavourite: false, image: "assets/images/food1.png"),
    Food(name: "Berry mango combo", price: 8000, isFavourite: true, image: "assets/images/food2.png")
  ];
  List<Food> cart = [];

  late int notification;
  
  ThemeController themeController = ThemeController();

  @override
  void initState() {
    notification = cart.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Builder(
                      builder: (context) {
                        return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(Icons.menu, color: Color.fromRGBO(7, 6, 72, 1)));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_basket_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                              cart.isNotEmpty?
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(150),
                                ),
                                child: Center(child: Text("${notification}",style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),),
                              ):Container()]
                        ),
                        Text("go to cart", style: Theme.of(context).textTheme.headlineSmall)
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text("Hello ${widget.name},", style: Theme.of(context).textTheme.headlineMedium),
                        Text("What fruit salad", style: Theme.of(context).textTheme.headlineLarge)
                      ],
                    ),
                    Text("combo do you want today?", style: Theme.of(context).textTheme.headlineLarge)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                            hintText: "Search for fruit salad combos",
                            hintStyle: TextStyle(fontWeight: FontWeight.w100),
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ),
                  const Expanded(flex: 2, child: Icon(Icons.menu))
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Recommended Combo",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 28,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: GridView.builder(
                  itemCount: listOfFood.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 3),
                  itemBuilder: (context, index) {
                    return FoodCard(
                        food: listOfFood[index],
                        addToCart: () {
                          addToCart(listOfFood[index]);
                        },color: Colors.white,);
                  },
                ),
              ),

              Container(
                height: 300,
                width: double.infinity,
                child: FoodTabs(addToCart: addToCart, cart: cart),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: toggleTheme, child: const Text("changeTheme")))
          ],
        ),
      ),
    );
  }

  void addToCart(Food food) {
    setState(() {
      cart.add(food);
      notification = cart.length;
    });
  }
  void toggleTheme(){
    setState(() {
    if(themeController.themeMode == ThemeMode.dark){
        themeController.themeMode = ThemeMode.light;
    }else{
      themeController.themeMode = ThemeMode.dark;
    }
      
    });
  }
}
