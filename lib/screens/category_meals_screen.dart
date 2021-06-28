
import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_meals.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/category.dart';
import 'package:provider/provider.dart';


class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({ Key? key,}) : super(key: key);

  static const  String routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {

    final Category category = ModalRoute.of(context)!.settings.arguments as Category;
    final filters = context.watch<MealProvider>().filters;
    final List<Meal> _meals = context.watch<MealProvider>().availableMeals(filters).where((meal) 
      => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title)
      ),
      body: ListView.builder(
        itemCount: _meals.length,
        itemBuilder: (context, index) => MealItem(_meals[index]),
      ),
    );
  }
}