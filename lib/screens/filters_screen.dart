import 'dart:html';

import 'package:flutter/material.dart';
import 'package:meal_app/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/meal_provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({ Key? key }) : super(key: key);

  static const String routeName = "/filter-screen";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  @override
  Widget build(BuildContext context) {
    Map<String, bool> _filters = context.watch<MealProvider>().filters;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text("At just your meal selection",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Nunito"
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _switchListTile(
                  "Gluten free",
                  "Only include gluten free meal",
                  _filters['gluten'],
                  (val){
                    context.read<MealProvider>().updateFilter("gluten", val);
                  }
                ),
                _switchListTile(
                  "Lactose free",
                  "Only include lactose free meal",
                  _filters['lactose'],
                  (val){
                    context.read<MealProvider>().updateFilter("lactose", val);
                  }
                ),
                _switchListTile(
                  "Vegetarian",
                  "Only include Vegatarian meal",
                  _filters['vegetarian'],
                  (val){
                    context.read<MealProvider>().updateFilter("vegetarian", val);
                  }
                ),
                _switchListTile(
                  "Vegan",
                  "Only include Vegan meal",
                  _filters['vegan'],
                  (val){
                    context.read<MealProvider>().updateFilter("vegan", val);
                  }
                ),
              ],
            )
          ),
        ],
      )
    );
  }

  Widget _switchListTile(String title, String subtitle, bool? currentValue, void Function(bool) updateValue){
    return SwitchListTile(
      onChanged: updateValue,
      value: currentValue!,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}