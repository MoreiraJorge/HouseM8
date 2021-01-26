import 'package:flutter/cupertino.dart';
import 'package:housem8_flutter/services/reviews_service.dart';
import 'package:housem8_flutter/view_models/reviews_view_model.dart';

class ReviewsListViewModel extends ChangeNotifier {
  List<ReviewsViewModel> reviews = List<ReviewsViewModel>();

  Future<void> fetchMateReviews() async {
    final returned = await ReviewsService().fetchMateReviews();
    this.reviews =
        returned.map((review) => ReviewsViewModel(reviews: review)).toList();
    notifyListeners();
  }
}
