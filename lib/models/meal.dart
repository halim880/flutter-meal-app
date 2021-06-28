
import 'package:meal_app/models/category.dart';

enum Complexity {
  easy,
  medium,
  hard
}

enum Affordability{
  affordable,
  pricey,
  luxurious,
}


class Meal{
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegetarian;
  final bool isVegan;

  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  String get complexityText {
    switch(complexity){
      case Complexity.easy: return "Easy";
      case Complexity.medium: return "Medium";
      case Complexity.hard: return "Hard";
      default : return "Unknown";
    }
  }

  String get affordabilityText {
    switch(affordability){
      case Affordability.affordable: return "Affordable";
      case Affordability.pricey: return "Pricey";
      case Affordability.luxurious: return "Luxurious";
      default : return "Unknown";
    }
  }
}