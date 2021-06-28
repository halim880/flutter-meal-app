
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_sreen.dart';
import '../models/meal.dart';


class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem(this.meal, { Key? key,}) : super(key: key);



  // onTab Navigator
  void _navigate(BuildContext context){
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName, 
      arguments: meal
    );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> _navigate(context),
      
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
                ),
                child: Image.network(meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(10),
                  color: Colors.black54,
                  child: Text(meal.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    const Icon(Icons.schedule),
                    const SizedBox(height: 20),
                    Text(meal.duration.toString() + "min"),
                  ],),

                  Row(children: [
                    const Icon(Icons.work),
                    const SizedBox(height: 20),
                    Text(meal.complexityText),
                  ],),

                  Row(children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(height: 20),
                    Text(meal.affordabilityText),
                  ],)
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}