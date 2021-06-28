import 'package:flutter/foundation.dart';
import 'package:meal_app/data/dummy_meals.dart';
import 'package:meal_app/models/meal.dart';

// import 'package:flutter/cupertino.dart';

class MealProvider extends ChangeNotifier {
  final List<Meal> _meals = dummyMeals;
  final List<Meal> _favoritedMeal = [];

  final Map<String, bool> _filters = {
    "gluten" : false,
    "vegan" : false,
    "lactose": true,
    "vegetarian" :false,
  };

  List<Meal> get meals =>_meals;
  Map<String, bool> get filters => _filters;
  List<Meal> get favoritedMeal => _favoritedMeal;
  


  void updateFilter(String key, bool val){
    filters[key] = val;
    notifyListeners();
  }

  List<Meal> availableMeals(Map<String, bool> filters) {
    return meals.where((meal){
      if(filters['gluten']! && !meal.isGlutenFree) return false;
      if(filters['vegan']! && !meal.isVegan) return false;
      if(filters['lactose']! && !meal.isLactoseFree) return false;
      if(filters['vegetarian']! && !meal.isVegetarian) return false;
      return true;
    }).toList();
  }

  void toggleFavorited(Meal meal){
    if(_favoritedMeal.contains(meal)) {
      _favoritedMeal.remove(meal);
    }
    else { 
      _favoritedMeal.add(meal);
    }
    notifyListeners();
  }

  bool isFavorited(Meal meal){
    return _favoritedMeal.contains(meal);
  }
}