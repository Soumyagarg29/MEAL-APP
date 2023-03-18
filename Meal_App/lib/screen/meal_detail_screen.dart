import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routename = '/meal_detail';
  final Function toggleFav;
  final Function isMealFav;
  MealDetailScreen(this.toggleFav, this.isMealFav);
  Widget BuildTitle(BuildContext context, String text) {
    return Container(
        child: Card(
      elevation: 5,
      color: Theme.of(context).primaryColorDark,
      shadowColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    ));
  }

  Widget BuildSteps(BuildContext context, Widget w) {
    return Card(
      child: Container(
        color: Theme.of(context).primaryColorDark,
        height: 150,
        width: double.infinity,
        child: w,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal obj = ModalRoute.of(context).settings.arguments as Meal;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => obj.id == meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(obj.title),
        actions: [
          FloatingActionButton.small(
            
            onPressed: () => toggleFav(obj.id),
            child: Icon(isMealFav(obj.id) ? Icons.star : Icons.star_border),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.network(selectedMeal.imageUrl),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
            ),
          ),
          BuildTitle(context, "Ingridients"),
          BuildSteps(
              context,
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).primaryColorLight,
                  child: Text(
                    selectedMeal.ingredients[index],
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              )),

          BuildTitle(context, "Steps"),
          BuildSteps(
              context,
              ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orangeAccent,
                    child: Text('# ${(index)}'),
                  ),
                  title: Card(
                    child: Text(
                      selectedMeal.steps[index],
                    ),
                  ),
                ),
                itemCount: selectedMeal.steps.length,
              )),

          // child: Text(obj.ingredients.toString()),
          // shadowColor: Colors.amber,
          // elevation: 10,
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () {
          // Navigator.pop(context);
          Navigator.of(context).pop(selectedMeal.id);
        },
      ),
    );
  }
}
