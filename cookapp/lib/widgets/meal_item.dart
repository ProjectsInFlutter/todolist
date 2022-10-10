import 'package:cookbookapp/models/meal_category.dart';
import 'package:cookbookapp/screens/meal_details.dart';
import 'package:flutter/material.dart';

class Mealitem extends StatefulWidget {
  final String id;
  final String imageUrl;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  Mealitem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.complexity,
    required this.affordability,
    required this.duration,
  });

  @override
  _MealitemState createState() => _MealitemState();
}

class _MealitemState extends State<Mealitem> {
  String get complexityText {
    switch (widget.complexity) {
      case Complexity.Simple:
        return 'simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;

      default:
        return 'Undefined';
        break;
    }
  }

  String get affordabilityText {
    switch (widget.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Undefined';
        break;
    }
  }

  void selectMeal(BuildContext conx) {
    Navigator.of(conx)
        .popAndPushNamed(MealDetails.routeName, arguments: widget.id);
  }

  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: Container(
                    color: Colors.black87,
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timelapse),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${widget.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.add_a_photo),
                      SizedBox(
                        width: 10,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 10,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite),
                        color: _hasBeenPressed ? Colors.red : Colors.grey,
                        tooltip: 'Add to your favorite meals',
                        onPressed: () {
                          setState(() {
                            _hasBeenPressed = !_hasBeenPressed;
                          });
                        },
                      )
                    ],
                  ),
*/