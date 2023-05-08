import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/screens/meal_details.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavo,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavo;
  void selectmeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
            meal: meal,
            onToggleFavo: onToggleFavo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectmeal(context, meal);
          }),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Uh Oh ....'),
            SizedBox(height: 16),
            Text('Try different'),
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
