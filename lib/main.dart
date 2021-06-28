import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/routes.dart';
import 'package:provider/provider.dart';
import '/screens/home_screen.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> MealProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Nunito",
          textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 52, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 52, 51, 1),
            ),
            headline1: const TextStyle(
              fontSize: 20,
              fontFamily: "Nunito"
            )
          )
        ),
        routes: routes,
        onUnknownRoute: (settings){
          return MaterialPageRoute( builder: (ctx)=> const HomeScreen(),);
        },
      ),
    );
  }
}