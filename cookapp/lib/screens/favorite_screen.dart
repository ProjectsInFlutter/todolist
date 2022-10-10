import 'package:cookbookapp/models/meal_category.dart';
import 'package:cookbookapp/widgets/meal_item.dart';
import 'package:flutter/material.dart';


class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavoriteScreen(this.favoriteMeal);

  //static const routeName = 'Favorite_Screen';

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('Your Favorite List Is Empty'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Mealitem(
            id: favoriteMeal[index].id,
            imageUrl: favoriteMeal[index].imageUrl,
            title: favoriteMeal[index].title,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,
            duration: favoriteMeal[index].duration,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
