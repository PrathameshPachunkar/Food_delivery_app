import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class RecentOrder extends StatelessWidget {
  RecentOrderCont(BuildContext context , Order order){

    return Container(
      width: 320,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 0.4,color: Colors.grey[200]),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15) ,
                    child: Image(
                      fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                        image: AssetImage(order.food.imageUrl) )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.0,),
                        Text(order.food.name ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 4.0,),
                        Text(order.restaurant.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 4.0,),
                        Text(order.date,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 4.0,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30)
            ),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,size: 30,))
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: Text("Recent orders",style: TextStyle(
            fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
            ),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (context , index) {
                Order order = currentUser.orders[index];
            return RecentOrderCont(context,order);
          }
          ),
        )
      ],
    );
  }
}
