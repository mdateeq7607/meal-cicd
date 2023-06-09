import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavo,});


  final Meal meal;
  final void Function(Meal meal) onToggleFavo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
                onPressed: () {
              onToggleFavo(meal);
            },
                icon: Icon(Icons.star)),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 14),
                Text('Ingredients',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        )),
                const SizedBox(height: 14),
                for (final ingredients in meal.ingredients)
                  Text(ingredients,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          )),
                const SizedBox(height: 14),
                Text('Steps',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        )),
                const SizedBox(height: 14),
                for (final step in meal.steps)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Text(
                      step,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
