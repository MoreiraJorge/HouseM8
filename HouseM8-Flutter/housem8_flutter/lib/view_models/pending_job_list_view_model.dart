import 'package:flutter/cupertino.dart';
import 'package:housem8_flutter/services/pending_jobs_service.dart';
import 'package:housem8_flutter/view_models/pending_job_view_model.dart';

class PendingJobListViewModel extends ChangeNotifier {
  List<PendingJobViewModel> pendingJobs = List<PendingJobViewModel>();

  Future<void> fetchPendingJob() async {
    final returned = await PendingJobsService().fetchJobPosts();
    this.pendingJobs =
        returned.map((job) => PendingJobViewModel(pendingJobs: job)).toList();
    notifyListeners();
  }
}
