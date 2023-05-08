import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/categories.dart';
import 'package:flutter_meal_app/screens/meals.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen ({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }

}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMsg(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
      content: Text(message),
    ));
  }

  void _toggleMealFavStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMsg('mealRemoved');
      });

    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMsg('mealAdded');
      });

    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {

  }
  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavo: _toggleMealFavStatus,);
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen( meals: _favoriteMeals, onToggleFavo: _toggleMealFavStatus,);
      activePageTitle = 'Your Favs';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: const MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const  [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favories')
        ],
      ),
    );
  }

}