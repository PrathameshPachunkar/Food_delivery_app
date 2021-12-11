import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
   final ratings;
   Ratings(this.ratings);

  @override
  Widget build(BuildContext context) {
    String rating = "";
    for(int i =0;i<ratings;i++){
      rating += "⭐";
    }
    return Text(rating,style: TextStyle(fontSize: 18),);
  }
}
