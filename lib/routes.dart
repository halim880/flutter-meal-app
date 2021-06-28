
import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_sreen.dart';
import 'package:meal_app/screens/tab_screen.dart';

final Map<String, Widget Function(BuildContext)>
routes = {
  '/': (ctx)=> TabsScreen(),
  CategoryMealsScreen.routeName : (ctx) => const CategoryMealsScreen(),
  MealDetailScreen.routeName : (ctx) => const MealDetailScreen(),
  FilterScreen.routeName : (ctx) => const FilterScreen(),
  FavoriteScreen.routeName : (ctx) => const FavoriteScreen(),
};