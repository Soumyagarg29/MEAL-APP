//TOP TABS
//import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/screen/FavouritesScreen.dart';
// import 'package:flutter_complete_guide/screen/categories_screen.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({Key key}) : super(key: key);

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       child: Scaffold(
//           appBar: AppBar(
//               title: Text("Meals"),
//               bottom: TabBar(tabs: <Widget>[
//                 Tab(
//                   icon: Icon(Icons.category),
//                   text: "CATEGORIES",
//                 ),
//                 Tab(
//                   icon: Icon(Icons.star),
//                   text: "FAV",
//                 )
//               ])),
//           body: TabBarView(
//               children: <Widget>[CategoriesScreen(), FavouritesScreen()])),
//       length: 2, //no of tabs,
//     );
//   }
// }

//bottom tabs
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screen/FavouritesScreen.dart';
import 'package:flutter_complete_guide/screen/categories_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favMeal;
  TabsScreen(this.favMeal);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pagess;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    //init state is extremely useful when we have variables as memeber of the first state and we ned to use them in the second class of a stateful widget
    // TODO: implement initState
    pagess = [
      {'pages': CategoriesScreen(), 'title': 'Categories'},
      {'pages': FavouritesScreen(widget.favMeal), 'title': 'Your favourites'}
    ];
    super.initState();
  }

  void _selectpage(int index) {
    setState(
      () {
        _selectedPageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pagess[_selectedPageIndex]['title'])),
      drawer: MainDrawer(),
      body: pagess[_selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        backgroundColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.star_border_outlined),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
