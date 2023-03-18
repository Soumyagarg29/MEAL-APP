import 'package:flutter/material.dart';
import '../screen/category_meals_screen.dart';
import '../model/Category.dart';

class CategoryItem extends StatelessWidget {
  final Category obj;
  void SelectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealScreen(
    //         obj: obj,
    //       );
    //     },
    //   ),
    // );
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routename,
        arguments: {obj}); //sending the data via the navigation
  }

  CategoryItem({@required this.obj});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Center(
          child: Text(
            obj.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [obj.color.withOpacity(0.9), obj.color],
            begin: Alignment.center,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
