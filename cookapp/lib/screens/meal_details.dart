import 'package:cookbookapp/screens/custom_drawer.dart';
import 'package:flutter/material.dart';
import '/dummy_data.dart';

class MealDetails extends StatefulWidget {
  static const routeName = 'meal_details';
  final Function favoriteToggle;
  final Function isFavorite;
  MealDetails(this.favoriteToggle, this.isFavorite);

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final mealDetails = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    Widget cardTitle(BuildContext context, String str) {
      return Container(
        margin: EdgeInsets.all(20),
        child: Text(
          str,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(128, 0, 0, 0.9),
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    Widget ContainerBuild(Widget child) {
      return Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white54,
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          child: child);
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(mealDetails.title,
            style: Theme.of(context).textTheme.subtitle1),
        titleSpacing: -50,
        centerTitle: true,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      mealDetails.imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            cardTitle(context, 'Ingredients'),
            ContainerBuild(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(
                      mealDetails.ingredients[index],
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Color.fromRGBO(128, 0, 0, 0.9)),
                    ),
                  ));
                },
                itemCount: mealDetails.ingredients.length,
              ),
            ),
            cardTitle(context, 'Steps'),
            ContainerBuild(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(
                      mealDetails.steps[index],
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Color.fromRGBO(128, 0, 0, 0.9)),
                    ),
                  ));
                },
                itemCount: mealDetails.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.favoriteToggle(mealId),
        child: Icon(
            widget.isFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
      ),
      drawer: CustomDrawer(),
    );
  }
}
