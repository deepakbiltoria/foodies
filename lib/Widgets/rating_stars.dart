import 'package:flutter/material.dart';
import 'package:foodies/constants.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  RatingStars(this.rating);

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '🌟 ';
    }
    stars.trim();
    return Text(
      stars,
      style: kTitleSmall,
      overflow: kellipsisOverflow,
    );
  }
}
