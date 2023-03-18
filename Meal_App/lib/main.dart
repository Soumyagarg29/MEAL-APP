import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screen/filters_screen.dart';
import 'package:flutter_complete_guide/screen/meal_detail_screen.dart';
import 'package:flutter_complete_guide/screen/tabs_screen.dart';
import 'screen/categories_screen.dart';
import './screen/category_meals_screen.dart';
import 'model/Category.dart';
import './dummy_data.dart';
import 'widgets/Category_item.dart';
import './screen/meal_detail_screen.dart';
import './model/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeal = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where(
        (meal) {
          if (filters['gluten'] && !meal.isGlutenFree) {
            return false;
          }
          if (filters['lactose'] && !meal.isLactoseFree) {
            return false;
          }
          if (filters['vegan'] && !meal.isVegan) {
            return false;
          }
          if (filters['vegetarian'] && !meal.isVegetarian) {
            return false;
          }
          return true; //null safety :/
        },
      ).toList();
    });
  }

  void toggleFavScreen(String mealId) {
    var existingindex = favouriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingindex >= 0) {
      setState(() {
        favouriteMeal.removeAt(existingindex);
      });
    } else {
      setState(() {
        favouriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFav(String id) {
    return favouriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEl Meals',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 97, 97, 93),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1))),
      ),
      home: TabsScreen(favouriteMeal),
      initialRoute: '/',
      routes: {
        CategoryMealScreen.routename: (context) =>
            CategoryMealScreen(availableMeals),
        MealDetailScreen.routename: (context) =>
            MealDetailScreen(toggleFavScreen, isMealFav),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(setFilters, filters),
      },
      // onUnknownRoute: //reached when flutter fails to build the screen, before throwing error flutter will try showing something on the screen 404fall back page,
      // onGenerateRoute:(settings){
      //   print(settings.arguments);
      //   if(settings.name == '/meal-detail')
      //   {return ...;}
      //   else if(settings.name =='/something-else')
      //   {return...;}
      //   return MaterialPageRoute(builder: context)=>CategoriesScreen()})} //home marks the first screen or room screen of the app
    );
  }
}

//Home page not added as i am making categories screen only as the home screen
// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Learn Cooking the Easy Way"),
//       ),
//       body: GridView(
//         children: DUMMY_CATEGORIES
//             .map((catdata) => CategoryItem(catdata.title, catdata.color))
//             .toList(),
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 200,
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20,
//         ),
//       ),
//     );
//   }
// }
