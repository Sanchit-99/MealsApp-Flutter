//display meals of chosen category

import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/widgets/meal_item.dart';

import '../model/meals.dart';

class MealsScrren extends StatefulWidget {
  // final String title;
  // final String id;

  // MealsScrren({this.title,this.id});

 final List<Meal> availableMeals;

  MealsScrren(this.availableMeals);

  @override
  _MealsScrrenState createState() => _MealsScrrenState();
}

class _MealsScrrenState extends State<MealsScrren> {
  var _loadedInitData = false;
  String categoryTitle;
  List<Meal> displayedMeals;
   @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration, 
            id: displayedMeals[index].id,          
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}