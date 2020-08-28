import 'package:flutter/material.dart';
import 'package:meals/model/meals.dart';
import 'package:meals/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final favoriteMeals;

  FavouriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('No Favorites Yet!'),
      );
    } else {
       return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration, 
            id: favoriteMeals[index].id,          
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
