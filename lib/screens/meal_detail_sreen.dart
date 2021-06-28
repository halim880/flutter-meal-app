import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({ Key? key }) : super(key: key);
  static String routeName = "/meal-detail";
  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover,),
            ),
            _sectionTitle(context, "Ingridients"),
            _container(ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index){
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(meal.ingredients[index]),
                    ),
                );
                }
              ),
            ),
            _sectionTitle(context, "Steps"),
            _container(ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index+1}"),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    const Divider(),
                  ],
                );
              }
            ))
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> context.read<MealProvider>().toggleFavorited(meal),
        child: context.watch<MealProvider>().isFavorited(meal)
          ? const Icon(Icons.favorite, color: Colors.pink,)
          : const Icon(Icons.favorite_border)
      ),


    );
  }

  Widget _sectionTitle(BuildContext context, String title){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style:Theme.of(context).textTheme.headline1),
    );
  }

  Widget _container(Widget child){
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}