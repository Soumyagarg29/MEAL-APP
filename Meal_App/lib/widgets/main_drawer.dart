import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      Container(
        color: Theme.of(context).primaryColorDark,
        child: Text(
          "COOKING",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        height: 120,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
      ),
      SizedBox(height: 20),
      ListTile(
          leading: Icon(Icons.restaurant, size: 26),
          title: Text(
            "MEALS",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
      ListTile(
        leading: Icon(Icons.settings, size: 26),
        title: Text(
          "FILTERS",
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        },
      ),
    ]));
  }
}
