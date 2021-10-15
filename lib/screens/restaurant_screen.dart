import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodies/Widgets/rating_stars.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/model/food.dart';
import 'package:foodies/model/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen(this.restaurant);
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food menuItem) {
    return Stack(
      alignment:
          Alignment.center, // helped with centering the two text widgets.
      children: [
        Container(
          height: 160.0,
          width: 160.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(menuItem.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        Container(
          height: 160.0,
          width: 160.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(colors: [
              Colors.black87.withOpacity(0.3),
              Colors.black54.withOpacity(0.6),
              Colors.black38.withOpacity(0.3),
              Colors.black26.withOpacity(0.3)
            ], stops: [
              0.1,
              0.4,
              0.7,
              0.9
            ]),
          ),
        ),
        Positioned(
          // helped with centering the two text widgets.
          top: 45.0,
          child: Column(
            children: [
              Text(
                '${menuItem.name}',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.white),
              ),
              Text(
                r'$' + '${menuItem.price}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              width: 48.0,
              child: IconButton(
                  iconSize: 30.0,
                  color: Colors.white,
                  icon: Icon(
                    Icons.add,
                  ),
                  onPressed: () {}),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //below if we use listview instead of Column the image will not go under notification bar.
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                    height: 220.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.restaurant.imageUrl)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade200,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_sharp),
                          iconSize: 40.0,
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade200,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: IconButton(
                          icon: Icon(Icons.favorite),
                          iconSize: 40.0,
                          color: Colors.white,
                          onPressed: () {}),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            //TODO: we appliead Expanded here to padding(whch is the parent to gridview) so to remove unbounded error of gridview.
            child: Padding(
              padding: kTitleBigPadding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.restaurant.name,
                        style: kTitleBig,
                      ),
                      Text(
                        '0.2 km away',
                        style: ksubtitle,
                      )
                    ],
                  ),
                  RatingStars(widget.restaurant.rating),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    widget.restaurant.address,
                    style: kTitleSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: kTitleBigPadding,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text('Reviews'),
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      Padding(
                        padding: kTitleBigPadding,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text('Contact'),
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Menu',
                    style: kHeadingTextStyle,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),

                  //TODO: Link to the solution of below gridview error - 'https://stackoverflow.com/questions/57803737/flutter-renderflex-children-have-non-zero-flex-but-incoming-height-constraints'
                  Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.all(5.0),
                      crossAxisCount: 2,
                      children: List.generate(
                        widget.restaurant.menu.length,
                        (index) {
                          Food food = widget.restaurant.menu[index];
                          return _buildMenuItem(food);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
