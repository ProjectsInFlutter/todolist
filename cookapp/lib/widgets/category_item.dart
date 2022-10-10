import 'package:cookbookapp/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class Categoryitem extends StatefulWidget {
  final String id;
  final String title;
  final Color color;

  const Categoryitem(
    this.id,
    this.title,
    this.color,
  );

  @override
  _CategoryitemState createState() => _CategoryitemState();
}

class _CategoryitemState extends State<Categoryitem> {
  void selectedCategory(BuildContext conx) {
    Navigator.of(conx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': widget.id,
      'title': widget.title,
    });
  }

  bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(widget.id);
    }).toList();

    return InkWell(
      onTap: () {
        selectedCategory(context);
      },
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 400,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [widget.color, widget.color.withOpacity(0.4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
/*Row(
              children: [
                Container(
                  child: Expanded(
                    flex: 2,
                    child: Text(
                      'Meals Number : $count',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ), */

  /*
  InkWell(
      onTap: () {
        selectedCategory(context);
      },
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 400,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Expanded(
              flex: 1,
              child: new IconButton(
                icon: Icon(Icons.favorite),
                iconSize: 25,
                color: _hasBeenPressed ? Colors.red : Colors.white,
                tooltip: 'Add to your favorite category',
                onPressed: () {
                  setState(() {
                    _hasBeenPressed = !_hasBeenPressed;
                  });
                },
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [widget.color, widget.color.withOpacity(0.4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      ),
    );
  */              