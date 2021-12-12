import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/RAting.dart';

class restaurentscreen extends StatefulWidget {
  final Restaurant restaurant;
  restaurentscreen({this.restaurant});

  @override
  _restaurentscreenState createState() => _restaurentscreenState();
}

class _restaurentscreenState extends State<restaurentscreen> {
  @override
  menuitem(Food items){
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 175,
          width: 175,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(items.imageUrl,),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15)
          ),
          // child: Image(image: AssetImage(items.imageUrl,),fit: BoxFit.cover,),
        ),
        Container(
          height: 175,
            width: 175,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.black.withOpacity(0.3),
              Colors.black87.withOpacity(0.3),
              Colors.black54.withOpacity(0.3),
              Colors.black38.withOpacity(0.3),
            ],
              stops: [
                0.1,
                0.4,
                0.7,
                0.9,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 65,
          child: Column(
            children: [
              Text(items.name,style: TextStyle(color: Colors.white,fontSize: 30),),
              Text("\$${items.price}",style: TextStyle(color: Colors.white,fontSize: 20),),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child:  Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30)
            ),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,size: 30,))
        ),)
      ],
    );
  }



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
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.restaurant.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("0.2km away",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(height: 20,),
                Text(widget.restaurant.address,style: TextStyle(fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
                Ratings(widget.restaurant.rating),
              ],
            ),
          ),
         Padding(
           padding:  EdgeInsets.symmetric(horizontal: 20),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               TextButton(
                 style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                     shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                 ),
                 onPressed: (){},
                 child: Text('Reviews',style: TextStyle(color: Colors.white),),),

               TextButton(
                 style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                     shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                 ),
                 onPressed: (){},
                 child: Text('Contact',style: TextStyle(color: Colors.white),),),
             ],
           ),
         ),
          Center(child: Text('MENU',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          SizedBox(height: 15,),
         Expanded(
           child: GridView.count(
             padding: EdgeInsets.symmetric(horizontal: 20),
             crossAxisCount: 2,
           children: List.generate(widget.restaurant.menu.length, (index) {
             Food food = widget.restaurant.menu[index];
             return menuitem(food);


           },),
           ),
         ),
        ],
      ),
    );
  }
}
