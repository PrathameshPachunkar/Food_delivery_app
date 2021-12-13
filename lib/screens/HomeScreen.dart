import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/main.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/RAting.dart';
import 'package:flutter_food_delivery_ui/widgets/RecentOreder_widget.dart';
import 'CartScreen.dart';
import 'restaurentscreen.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NearbyResataurants(){
List<Widget> restaurantslist = [];
restaurants.forEach((Restaurant restaurant) {
restaurantslist.add(GestureDetector(
  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_) => restaurentscreen (restaurant: restaurant,),));},
  child:   Container(
  
    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
  
    decoration: BoxDecoration(
  
      color: Colors.white,
  
      borderRadius: BorderRadius.circular(15.0),
  
      border: Border.all(color:  Colors.grey[200], width: 0.4),
  
    ),
  
    child: Row(
  
      children: [
  
        ClipRRect(
  
          borderRadius: BorderRadius.circular(15.0),
  
          child: Hero(
            tag: restaurant.imageUrl,
            child: Image(image: AssetImage(restaurant.imageUrl),

            height: 150,

            width: 150,

            fit: BoxFit.cover,

            ),
          ),
  
        ),
  
        Container(
  
          child: Column(
  
            crossAxisAlignment: CrossAxisAlignment.start,
  
            mainAxisAlignment: MainAxisAlignment.center,
  
            children: [
  
              Text(restaurant.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
  
              SizedBox(height: 10,),
  
              Ratings(restaurant.rating),
  
              SizedBox(height: 10,),
  
              Text(restaurant.address,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),overflow: TextOverflow.ellipsis),
  
              SizedBox(height: 10,),
  
              Text("0.2 km away",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),overflow: TextOverflow.ellipsis)
  
            ],
  
          ),
  
        )
  
      ],
  
    ),
  
  ),
));
},
);
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: restaurantslist,
);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading:IconButton(onPressed: (){}, icon: Icon(Icons.account_circle)),
        centerTitle: true,
        title: Text('Food Delivery'),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) =>CartScreen()));
          }, child: Text('Cart(${currentUser.cart.length})',style: TextStyle(color: Colors.white,fontSize: 20),)),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding:  EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                enabled: true,
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){},
                ),
                hintText: 'Search food or restaurant',
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          RecentOrder(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Text('Nearby Restaurants',style: TextStyle(fontWeight: FontWeight.w600,
            fontSize: 24),),
          ),
          NearbyResataurants(),
        ],
      ),

    );
  }
}
