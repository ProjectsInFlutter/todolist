import 'package:cookbookapp/dummy_data.dart';
import 'package:cookbookapp/models/meal_category.dart';
import 'package:cookbookapp/screens/category_meals_screen.dart';
import 'package:cookbookapp/screens/favorite_tab.dart';
import 'package:cookbookapp/screens/filters_screen.dart';
import 'package:cookbookapp/screens/meal_details.dart';
import 'package:cookbookapp/screens/tab_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> Filters = {
    'GlutenFree': false,
    'LactoseFree': false,
    'Vegan': false,
    'Vegetarian': false,
  };
  List<Meal> filtersMeal = DUMMY_MEALS;
  List<Meal> favoriteMeal = [];

  void setfilters(Map<String, bool> userFilters) {
    setState(() {
      Filters = userFilters;
      filtersMeal = DUMMY_MEALS.where((meal) {
        if (Filters['GlutenFree'] == true && meal.isGlutenFree == true)
          return true;

        if (Filters['LactoseFree'] == true && meal.isLactoseFree == true)
          return true;

        if (Filters['Vegan'] == true && meal.isVegan == true) return true;

        if (Filters['Vegetarian'] == true && meal.isVegetarian == true)
          return true;

        return false;
      }).toList();
    });
  }

  void favoriteToggle(String MealId) {
    final favoriteIndex = favoriteMeal.indexWhere((meal) => meal.id == MealId);
    if (favoriteIndex >= 0) {
      setState(() {
        favoriteMeal.removeAt(favoriteIndex);
      });
    } else {
      setState(() {
        favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == MealId));
      });
    }
  }

  bool isFavorite(String MealId) {
    return favoriteMeal.any((meal) => meal.id == MealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CookApp',
      theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.green,
          // canvasColor: Color.fromRGBO(169, 154, 134, 0.8),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                    color: Color.fromRGBO(0, 33, 71, 0.9),
                    fontSize: 15,
                    fontStyle: FontStyle.italic),
                bodyText2: TextStyle(color: Colors.black, fontSize: 15),
                subtitle1: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color.fromRGBO(230, 232, 250, 0.9)),
                subtitle2: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    //color: Color.fromRGBO(230, 232, 250, 0.9),
                    color: Colors.white),
              )),
      // home: MyHomePage(),
      routes: {
        '/': (context) => TabScreen(favoriteMeal),
        //'/category': (context) => CateroryScreen(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(filtersMeal),
        MealDetails.routeName: (context) =>
            MealDetails(favoriteToggle, isFavorite),
        FlitersScreen.routename: (context) =>
            FlitersScreen(Filters, setfilters),
        FavoriteTab.routeName: (context) => FavoriteTab(favoriteMeal),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Spices Kingdom'),
          centerTitle: true,
        ),
        body: null);
  }
}
