import "package:flutter/material.dart";
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  // const FiltersScreen({Key? key}) : super(key: key);

  // VoidCallback saveFilters;
  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, var currentValue, updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      value: currentValue,
      subtitle: Text(
        description,
        style: TextStyle(fontSize: 20),
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final Map<String, bool> selectedfilter = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    "vegan": _vegan,
                    "vegetarian": _vegetarian
                  };
                  widget.saveFilters(selectedfilter);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust your meal selection',
                  style: TextStyle(fontSize: 24),
                )),
            Expanded(
                child: ListView(children: [
              _buildSwitchListTile(
                  'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile('Lactose-free',
                  'Only include Lactose-free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile('vegan', 'Only include vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ]))
          ],
        ));
  }
}
