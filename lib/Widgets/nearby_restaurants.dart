import 'package:flutter/material.dart';
import 'package:foodies/Widgets/rating_stars.dart';
import 'package:foodies/constants.dart';
import 'package:foodies/data/data.dart';
import 'package:foodies/model/restaurant.dart';
import 'package:foodies/screens/restaurant_screen.dart';

class NearbyRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: kHeadingPadding,
          child: Text(
            'Nearby Restaurants',
            style: kHeadingTextStyle,
          ),
        ),
        _buildRestraunts(context),
      ],
    );
  }

  _buildRestraunts(context) {
    List<Widget> restaurantList = [];

    restaurants.forEach(
      (Restaurant restaurant) {
        restaurantList.add(GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RestaurantScreen(restaurant)),
            );
          }, //TODO: add navigation to restaurant screen.
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey[200]),
              color: kContainerBlockColor,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                        height: 120.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                        image: AssetImage('${restaurant.imageUrl}')),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${restaurant.name}',
                          style: kTitleBig,
                          overflow: kellipsisOverflow,
                        ),
                        kSizedbox1,
                        RatingStars(restaurant.rating),
                        kSizedbox1,
                        Text(
                          '${restaurant.address}',
                          style: ksubtitle,
                          overflow: kellipsisOverflow,
                        ),
                        kSizedbox1,
                        Text(
                          '0.2 miles away',
                          style: ksubtitle,
                          overflow: kellipsisOverflow,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
      },
    );
    return Column(
      children: restaurantList,
    );
  }
}
