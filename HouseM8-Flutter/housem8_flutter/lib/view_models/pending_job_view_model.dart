import 'package:housem8_flutter/models/pending_jobs.dart';

class PendingJobViewModel {
  final PendingJobs pendingJobs;

  PendingJobViewModel({this.pendingJobs});

  String get title {
    return this.pendingJobs.title;
  }

  String get category {
    return this.pendingJobs.category.toString();
  }

  String get description {
    return this.pendingJobs.description;
  }
}
