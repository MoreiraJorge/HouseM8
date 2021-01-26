import 'package:flutter/material.dart';
import 'package:housem8_flutter/view_models/reviews_view_model.dart';

class MateReviewsList extends StatelessWidget {
  final List<ReviewsViewModel> mateReviews;

  MateReviewsList({this.mateReviews});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.mateReviews.length,
      itemBuilder: (context, index) {
        final reviews = this.mateReviews[index];

        return Card(
          child: ListTile(
            title: Text(
              reviews.reviews.author.split('.').last,
              style: TextStyle(fontSize: 20.0, color: Color(0xFF2F4858)),
            ),
            subtitle: Text(
              reviews.reviews.comment +
                  "; Rating: " +
                  reviews.reviews.rating.toString(),
              style: TextStyle(fontSize: 16.0, color: Color(0xFF5B82AA)),
            ),
          ),
        );
      },
    );
  }
}
