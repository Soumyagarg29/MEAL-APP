import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static var routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> prevfilters;

  FiltersScreen(this.saveFilters, this.prevfilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree;
  bool vegan;
  bool vegetarian;
  bool lactoseFree;
  @override
  initState() {
    //cannot be done directly in initialisation
    // TODO: implement initState
    glutenFree = widget.prevfilters['gluten'];
    vegan = widget.prevfilters['vegan'];
    vegetarian = widget.prevfilters['vegetarian'];
    lactoseFree = widget.prevfilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FILTERS SCREEN"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            final selectedfilters = {
              'gluten': glutenFree,
              'lactose': lactoseFree,
              'vegan': vegan,
              'vegetarian': vegetarian,
            };
            widget.saveFilters(selectedfilters);
          },
        )
      ]),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
          ),
          Expanded(
            child: ListView(children: [
              _buildSwitchListTile(
                  'Gluten Free', "Show all gluten free", glutenFree,
                  (newValue) {
                setState(() {
                  glutenFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Lactose Free', "Show all Lactose free", lactoseFree,
                  (newValue) {
                setState(() {
                  lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile('Vegan', "Show all Vegan dishes", vegan,
                  (newValue) {
                setState(() {
                  vegan = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', "Show all Vegetarian", vegetarian, (newValue) {
                setState(() {
                  vegetarian = newValue;
                });
              }),
            ]),
          ),
        ],
      ),
    );
  }
}
