import 'package:e_commerce_app/components/food_card.dart';
import 'package:e_commerce_app/constants/list_of_categories.dart';
import 'package:e_commerce_app/models/food.dart';
import 'package:flutter/material.dart';

class FoodTabs extends StatefulWidget {
  final void Function(Food) addToCart;
  final List<Food> cart;
  const FoodTabs({super.key,required this.addToCart,required this.cart});

  @override
  State<FoodTabs> createState() => _FoodTabsState();
}

class _FoodTabsState extends State<FoodTabs> with SingleTickerProviderStateMixin {

  ScrollController _scrollcontroller = ScrollController();

  BuildContext? _tabContext;

  final List<GlobalKey> _keys = List.generate(
    products.length,
    (index)=>GlobalKey()
  );
  
  final _listkey = GlobalKey();
  List<Color> catColors = [Colors.red.shade100,Colors.amber.shade300,Colors.blue.shade300];

  @override
  void initState() {
    _scrollcontroller.addListener(goToNextTab);
    super.initState();
  }

  void goToNextTab() {
  final listViewContext = _listkey.currentContext;
  if (listViewContext == null) return; // Handle null case
  
  final listViewBox = listViewContext.findRenderObject() as RenderBox;
  final listViewStart = listViewBox.localToGlobal(Offset.zero).dx;
  final listViewWidth = listViewStart + listViewBox.size.width;

  for (int i = 0; i < _keys.length; i++) {
    final context = _keys[i].currentContext;
    if (context == null) continue; // Handle null case

    final box = context.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);

    if (position.dx <= _scrollcontroller.offset) {
      final tabController = DefaultTabController.of(_tabContext!);
      if (tabController != null) {
        tabController.animateTo(i);
      }
    }
  }
}
void scrollToSelectedTab(int index) async{
  _scrollcontroller.removeListener(goToNextTab);
  final containerContext = _keys[index].currentContext!;
  if(containerContext != null){
  await Scrollable.ensureVisible(containerContext,
  duration: const Duration(seconds: 1));
  }
  _scrollcontroller.addListener(goToNextTab);
}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: products.length,
      initialIndex: 0,
      child: Builder(
        builder: (context) {
          _tabContext = context;
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [Container(
                child: TabBar(tabs: 
                const [
                  Tab(text: "Hottest",),
                  Tab(text: "popular"),
                  Tab(text:"newCombo")
                ],onTap: (int index) => scrollToSelectedTab(index) ,
                labelStyle: 
                  Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.black
                  )
                ,
                unselectedLabelColor: Colors.grey.shade500,
                unselectedLabelStyle: Theme.of(context).textTheme.headlineMedium,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.only(right: 20),),
              
                
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  key: _listkey,
                  controller:_scrollcontroller,
                  scrollDirection: Axis.horizontal,
                  itemCount: _keys.length,
                  itemBuilder: (context,index){
                  return Container(
                    key: _keys[index],
                    child: Row(
                      children: products[index].asMap().entries.map((entry){
                        final i = entry.key;
                        final food = entry.value;
                
                        return FoodCard(food: food, addToCart: ()=>widget.addToCart(products[index][i]), color: catColors[index]);
                      }).toList(),
                    ),
                  );
                }),
              ),]
              
            ),
          );
        }
      ),
    );
  }
}