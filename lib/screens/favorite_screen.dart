import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class  FavoriteScreen extends StatelessWidget {
  static const String routeName = "/favorite-meals";
  const FavoriteScreen ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Meal> _meals = context.watch<MealProvider>().favoritedMeal;

    return Scaffold(
      body: ListView.builder(
        itemCount: _meals.length,
        itemBuilder: (context, index) => MealItem(_meals[index]),
      ),
    );
  }
}