import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodies/data/data.dart';
import 'package:foodies/model/order.dart';

import '../constants.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  _buildCartItem(Order order) {
    return Container(
      height: 170.0,
      color: kContainerBlockColor,
      padding: EdgeInsets.all(20.0),
      //margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(15.0),
      //   border: Border.all(width: 1.0, color: Colors.grey[200]),
      //   color: kContainerBlockColor,
      // ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                      fit: BoxFit.cover,
                      height: 165.0,
                      width: 165.0,
                      image: AssetImage(order.food.imageUrl)),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      //TODO: we wrapped column with container and expanded so to make overflow property work
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${order.food.name}',
                          style: kTitleBig,
                          overflow: kellipsisOverflow,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${order.restaurant.name}',
                          style: ksubtitle,
                          overflow: kellipsisOverflow,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4.0, color: Colors.grey[200]),
                              borderRadius: BorderRadius.circular(15.0)),
                          width: 100.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //TODO : implement incrementer for order.quantity
                                },
                                child: Text(
                                  '+',
                                  style: kTitleSmall,
                                ),
                              ),
                              SizedBox(width: 20.0),
                              Text(
                                '${order.quantity}',
                                style: kTitleSmall,
                              ),
                              SizedBox(width: 20.0),
                              GestureDetector(
                                  onTap: () {
                                    //TODO : implement decrementer for order.food.quantity
                                  },
                                  child: Text('-', style: kTitleSmall)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(width: 1.0, color: Colors.grey[200]),
              ),
              margin: EdgeInsets.only(right: 5.0),
              padding: EdgeInsets.all(5.0),
              child: Text(
                r'$' +
                    '${order.quantity * order.food.price}', // Or '\$${order.quantity * order.food.price}'
                style: kTitleSmall,
                overflow: kellipsisOverflow,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach((Order order) {
      totalPrice += order.quantity * order.food.price;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart(${currentUser.cart.length})'),
      ),
      body: ListView.separated(
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.cart.length) {
            // imp logic for for loop, remember it
            Order orders = currentUser.cart[index];
            return _buildCartItem(orders);
          }
          return Container(
            color: kContainerBlockColor,
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated Delivery Time :',
                      style: kTitleBig,
                    ),
                    Text(
                      '25 min.',
                      style: kTitleSmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price :',
                      style: kTitleBig,
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[600]),
                    )
                  ],
                ),
                SizedBox(
                  height: 100.0,
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1.0,
            color: Colors.blueGrey,
          );
        },
      ),
      bottomSheet: Container(
        height: 100.0,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, -1), blurRadius: 6.0)
            ]),
        child: Center(
            child: FlatButton(
          child: Text(
            'CheckOut',
            style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0),
          ),
          onPressed: () {
            //TODO: implement checkout gateway
          },
        )),
      ),
    );
  }
}
