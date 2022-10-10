import 'package:cookbookapp/models/meal_category.dart';
import 'package:cookbookapp/screens/categories_screen.dart';
import 'package:cookbookapp/screens/favorite_screen.dart';
import 'package:cookbookapp/screens/favorite_tab.dart';
import 'package:flutter/material.dart';

import 'custom_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> FavoriteMeal;
  TabScreen(this.FavoriteMeal);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectIndex = 0;
  void SelectPage(int value) {
    setState(() {
      selectIndex = value;
    });
  }

  late List<Map<String, Widget>> pages = [];
  @override
  void initState() {
    pages = [
      {
        'page': CateroryScreen(),
        //'title': Text('Categories'),
      },
      {
        'page': FavoriteTab(widget.FavoriteMeal),
        // 'title': Text('Your Favorite'),
      }
    ];
    super.initState();
  }

  // String selecttitle() {
  //   if (pages[selectIndex]['page'] == CateroryScreen()) {}
  //   return 'Your Favorite';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      body: pages[selectIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: SelectPage,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.green,
        currentIndex: selectIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorites',
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
