import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizzling/components/my_description_box.dart';
import 'package:sizzling/components/my_drawer.dart';
import 'package:sizzling/components/my_food_title.dart';
import 'package:sizzling/components/my_silver_app_bar.dart';
import 'package:sizzling/components/my_tap_bar.dart';
import 'package:sizzling/module/food.dart';
import 'package:sizzling/module/restaurant.dart';
import 'package:sizzling/pages/food_page.dart';

import '../components/my_current_location.dart';
import '../components/my_food_tile.dart';  // Ensure this import path is correct

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{

  // tab controller
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food>fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of food in given category
  List<Widget> getFoodInThisCategory(List<Food>fullMenu){
    return FoodCategory.values.map((category){
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index){
          //get individual food
          final food = categoryMenu[index];

          //return food tile UI
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
            ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                 // current location
                const MyCurrentLocation(),

                // description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body:Consumer<Restaurant>(
          builder: (context, restaurant, child) =>  TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        )
      ),
    );
  }
}
