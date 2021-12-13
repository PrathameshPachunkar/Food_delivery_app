import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cartcont(Order order){
    int count = order.quantity;
    return Container(
      padding: EdgeInsets.all(20),
      height: 170,
      child: Row(
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(image: AssetImage(order.food.imageUrl),fit: BoxFit.cover,)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(order.food.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text(order.restaurant.name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                  Container(
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                          count--;
                          });
                        }, icon: Icon(Icons.add)),
                        Text("$count"),
                        IconButton(onPressed: (){
                          count++;
                        }, icon: Icon(Icons.add)),
                      ],
                    ),
                  )

                ],
              ),
            ],
          )//iamgerow
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text('Cart (${currentUser.cart.length})'),
      ),
      body:ListView.separated(
         physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context , int index){
        Order orders = currentUser.cart[index];
        return Cartcont(orders);
      },
          separatorBuilder:  ((context,index){return Divider(height: 1,color: Colors.grey,);}), itemCount: currentUser.cart.length)
    );
  }
}
