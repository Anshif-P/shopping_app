import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class StarWidget extends StatelessWidget {
  const StarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingBar.builder(
            initialRating: 5,
            minRating: 5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 25,
            itemBuilder: (context, _) => const Icon(
              Icons.star_rate_rounded,
              color: Color.fromARGB(255, 240, 218, 23),
            ),
            onRatingUpdate: (ratings) {
              _handleRatingUpdate(ratings);
            },
          ),
        ],
      ),
    );
  }

  void _handleRatingUpdate(double rating) {
    // print(widget.rating.value.toString());
  }
}
