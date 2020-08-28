import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/model/meals.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };
var favoriteMeals = [];
  var availableMeals = DUMMY_MEALS;
  void toggleFavorite(String mealid) {
    final existingindex =
        favoriteMeals.indexWhere((element) => element.id == mealid);
    if (existingindex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingindex);
      });
    } else {
        setState(() {
           favoriteMeals
          .add(DUMMY_MEALS.firstWhere((element) => element.id == mealid));
    
        });
       
    }
  }

  bool isMealFavorite(String mealid) {
    return favoriteMeals.any((element) => element.id == mealid);
  }


  
  void setFilters(var filterdata) {
    setState(() {
      filters = filterdata;
      availableMeals = DUMMY_MEALS.where((element) {
        if (filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        if (filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed"))),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(favoriteMeals),
        '/meals-screen': (ctx) => MealsScrren(availableMeals),
        '/meal-detail': (ctx) => MealDetailScreen(toggleFavorite,isMealFavorite),
        '/Filter': (ctx) => FiltersScreen(setFilters, filters),
      },
    );
  }
}
