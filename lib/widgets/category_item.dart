
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(this.category, { Key? key,}) : super(key: key);


  // Category Item Decuration
  BoxDecoration _boxDecoration(){
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          category.color.withOpacity(0.7),
          category.color,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  // onTab Navigator
  void _navigate(BuildContext context){
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName, 
      arguments: category
    );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> _navigate(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: _boxDecoration(),
        child: Text(category.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}