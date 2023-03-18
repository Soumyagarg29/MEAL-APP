import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widgets/meal_item.dart';
import './category_meals_screen.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favMeal;
  FavouritesScreen(this.favMeal);
  void removemeal2(String mealId) {
    print(favMeal.length);
  }

  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return Center(child: Text("YOU HAVE NO FAVOURITES YET !!!"));
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(favMeal[index], removemeal2);
        }),
        itemCount: favMeal.length,
      );
    }
  }
}
