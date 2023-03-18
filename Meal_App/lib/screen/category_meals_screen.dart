import 'package:flutter/material.dart';
import '../model/Category.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../model/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routename = "/category-meal";
  final List<Meal> avalMeal;

  CategoryMealScreen(this.avalMeal);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  var obj;
  List<Meal> displayedmeals;
  var LoadedInitData = false;

  @override
  void didChangeDependencies() {
    if (LoadedInitData == false) {
      final obj1 = ModalRoute.of(context).settings.arguments as Set<Category>;
      obj = obj1.elementAt(0);
      displayedmeals = widget.avalMeal.where((meal) {
        return meal.categories.contains(obj.id);
      }).toList();
      LoadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void removemeal(String mealId) {
    setState(() {
      print(displayedmeals.length);
      print("Here in remove meal");
      displayedmeals.removeWhere((meal) => meal.id == mealId);
      print(displayedmeals.length);
    });
  }

  Widget build(BuildContext context) {
    //receiving the object data via the modal route to use parameters otf tthe object
    return Scaffold(
        appBar: AppBar(title: Text(obj.title)),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(displayedmeals[index], removemeal);
          }),
          itemCount: displayedmeals.length,
        ));
  }
}
