import 'package:flutter/material.dart';
import 'package:flutter_meal_app/main.dart';
import 'package:flutter_meal_app/data/dummy_data.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/widgets/category_grid_item.dart';
import 'package:flutter_meal_app/screens/meals.dart';
import 'package:flutter_meal_app/models/category.dart';
import 'package:flutter_meal_app/widgets/custom_container.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavo,});
  final void Function(Meal meal) onToggleFavo;

  void _selectCategory(BuildContext context, Categoryy category) {
    final filterdMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filterdMeals,
              onToggleFavo: onToggleFavo,
          ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {

      return DeviceContainer(
        context: context,
        child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
              for (final category in availableCategories)
                CategoryGridItem(category: category, onSelectCategory: () {
                  _selectCategory(context, category);
                },)
        ],),
      );

  }
}
