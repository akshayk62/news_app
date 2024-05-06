import 'package:flutter/material.dart';
import 'package:news_app/controller/homescreen_controller.dart';
import 'package:news_app/model/homescreen/home_screen.dart';
import 'package:provider/provider.dart';
void main(){
runApp(const MyApp());

}



class MyApp extends StatelessWidget{
const MyApp ({super.key});

@override
 Widget build(BuildContext context){
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) =>Homecontroller()  )
    ],
    child: const MaterialApp(
      home: HomeScreen(),
      
    ),
  );

 }


}