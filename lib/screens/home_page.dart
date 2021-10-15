import 'package:flutter/material.dart';
import 'package:foodies/Widgets/nearby_restaurants.dart';
import 'package:foodies/Widgets/recent_orders.dart';
import 'package:foodies/data/data.dart';
import 'package:foodies/screens/shoping_cart.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  static final String id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle_rounded),
          iconSize: 35.0,
          onPressed: () {},
        ),
        title: Text('Foodie Heaven'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ShoppingCart()));
            },
            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 30.0,
                ),
                Text(
                  '(${currentUser.cart.length})',
                  style: TextStyle(fontSize: 20.0),
                )
              ],
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: kTitleBigPadding,
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white, // give white colour to the textfield
                  filled: true, // sets or say activate the given colour.
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      width: 0.8,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  hintText: 'Name your cravings here',
                  prefixIcon:
                      IconButton(icon: Icon(Icons.search), onPressed: () {}),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {},
                  )),
            ),
          ),
          RecentOrders(),
          NearbyRestaurants(),
        ],
      ),
    );
  }
}
