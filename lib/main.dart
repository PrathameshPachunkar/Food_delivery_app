import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/HomeScreen.dart';

void main(){
  runApp(Myapp());
}
 
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.deepOrangeAccent,
      ),
      home: HomeScreen(),
    );
  }
}

