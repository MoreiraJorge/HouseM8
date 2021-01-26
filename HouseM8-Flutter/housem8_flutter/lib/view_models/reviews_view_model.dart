import 'package:housem8_flutter/models/reviews.dart';

class ReviewsViewModel {
  final Reviews reviews;

  ReviewsViewModel({this.reviews});

  String get author {
    return this.reviews.author;
  }

  String get comment {
    return this.reviews.comment;
  }

  double get rating {
    return this.reviews.rating;
  }
}
