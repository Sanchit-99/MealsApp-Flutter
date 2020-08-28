import 'package:flutter/material.dart';
import 'package:meals/widgets/drawer.dart';

import 'categories_screen.dart';
import 'favourites_screen.dart';

class TabScreen extends StatefulWidget {

  final favoriteMeals;
  TabScreen(this.favoriteMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  var screens;
  void initState(){
    screens =[
    {
      'page':CategoriesScreen(),
      'title' : 'Categories'
    },
    {
      'page': FavouriteScreen(widget.favoriteMeals),
      'title':'My Favourites'
    }
  ];
   super.initState();
  }
  int idx=0;
  void selectscreen(int index){
    setState(() {
      idx=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(screens[idx]['title']),
         
        ),
        drawer:MainDrawer(),
        body: screens[idx]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectscreen,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.category),title: Text('Category')),
            BottomNavigationBarItem(icon: Icon(Icons.star),title: Text('Favourite')),
          ],
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: idx,
        ),
      );
  }
}
