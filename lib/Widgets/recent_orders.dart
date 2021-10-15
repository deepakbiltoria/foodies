import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodies/data/data.dart';
import 'package:foodies/model/order.dart';

import '../constants.dart';

class RecentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: kHeadingPadding,
          child: Text(
            'Recent Orders',
            style: kHeadingTextStyle,
          ),
        ),
        Container(
          height: 120.0,
          // color: Colors.blue,
          child: ListView.builder(
            physics:
                BouncingScrollPhysics(), // bouncing effect in listview of android, as in apple already got bouncy listviews.
            padding: EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrder(context, order);
            },
          ),
        )
      ],
    );
  }

  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
          color: kContainerBlockColor,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1.0, color: Colors.grey[200])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                    image: AssetImage(order.food.imageUrl),
                  ),
                ),
                Expanded(
                  // here expanded is used to activate overflow property of Text widget below
                  child: Container(
                    // padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name + '  sadafsdfsgfgdf',
                          style: kTitleSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(order.restaurant.name,
                            style: ksubtitle, overflow: TextOverflow.ellipsis),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(order.date,
                            style: ksubtitle, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: EdgeInsets.only(right: 20.0),
            width: 48.0,
            child: IconButton(
                iconSize: 30.0,
                color: Colors.white,
                icon: Icon(
                  Icons.add,
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
