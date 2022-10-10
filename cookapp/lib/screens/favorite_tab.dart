import 'package:cookbookapp/models/meal_category.dart';
import 'package:flutter/material.dart';
import 'favorite_screen.dart' as tabone;
import 'categories_screen.dart' as tabtwo;

class FavoriteTab extends StatefulWidget {
  static const routeName = 'Favorite_Tab';
  final List<Meal> favoriteMeal;
  FavoriteTab(this.favoriteMeal);

  @override
  _FavoriteTabState createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Your Favorite",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        bottom: TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 5.0,
          controller: controller,
          tabs: const [
            Tab(
              icon: Icon(Icons.restaurant_menu_outlined),
              text: "FavoriteMeal",
            ),
            Tab(
              icon: Icon(Icons.restaurant),
              text: 'FavoriteCategory',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          tabone.FavoriteScreen(widget.favoriteMeal),
          tabtwo.CateroryScreen(),
        ],
      ),
    );
  }
}
