import 'package:cookbookapp/models/meal_category.dart';
import 'package:cookbookapp/widgets/meal_item.dart';
import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'CategoryMeals';
  final List<Meal> filtersMeal;

  CategoryMealsScreen(this.filtersMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    final categoryMeals = widget.filtersMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title:
            Text(categoryTitle!, style: Theme.of(context).textTheme.subtitle1),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Mealitem(
                id: categoryMeals[index].id,
                imageUrl: categoryMeals[index].imageUrl,
                title: categoryMeals[index].title,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability,
                duration: categoryMeals[index].duration,
              ),
            ],
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
