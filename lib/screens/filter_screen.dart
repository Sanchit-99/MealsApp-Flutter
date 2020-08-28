import 'package:flutter/material.dart';
import 'package:meals/widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final passedFilters;
  FiltersScreen(this.saveFilters, this.passedFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool vegetarian = false;
  bool glutenfree = false;
  bool vegan = false;
  bool lactosefree = false;

  @override
  initState() {
    vegetarian = widget.passedFilters['vegetarian'];
    glutenfree = widget.passedFilters['gluten'];
    vegan = widget.passedFilters['vegan'];
    lactosefree = widget.passedFilters['lactose'];
    super.initState();
  }

  Widget switchTile(String title, bool currentvalue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentvalue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              var filters = {
                'gluten': glutenfree,
                'vegan': vegan,
                'vegetarian': vegetarian,
                'lactose': lactosefree,
              };
              widget.saveFilters(filters);
            },
          )
        ],
        title: Text('Filter'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Apply Filters to meals',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                switchTile('Gluten-Free', glutenfree, (newvalue) {
                  setState(() {
                    glutenfree = newvalue;
                  });
                }),
                switchTile('Lactose-Free', lactosefree, (newvalue) {
                  setState(() {
                    lactosefree = newvalue;
                  });
                }),
                switchTile('Vegetarian', vegetarian, (newvalue) {
                  setState(() {
                    vegetarian = newvalue;
                  });
                }),
                switchTile('Vegan', vegan, (newvalue) {
                  setState(() {
                    vegan = newvalue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
