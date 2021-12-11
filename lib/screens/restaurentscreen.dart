import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';

class restaurentscreen extends StatefulWidget {
  final Restaurant restaurant;
  restaurentscreen({this.restaurant});

  @override
  _restaurentscreenState createState() => _restaurentscreenState();
}

class _restaurentscreenState extends State<restaurentscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.restaurant.imageUrl)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(

                        Icons.arrow_back,
                        size: 30,
                      )),
                  IconButton(
                    color: Theme.of(context).primaryColor,
                      onPressed: () {}, icon: Icon(Icons.favorite)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
