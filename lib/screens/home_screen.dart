import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_categories.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DailyMeal"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: [
          for(Category category in kDummyCategories) CategoryItem(category),
        ],
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        )
      ),
    );
  }
}