import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housem8_flutter/view_models/pending_job_view_model.dart';
import 'package:housem8_flutter/widgets/pending_jobs_actions.dart';

class PendingJobsList extends StatelessWidget {
  final List<PendingJobViewModel> pendingJobs;

  PendingJobsList({this.pendingJobs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.pendingJobs.length,
        itemBuilder: (context, index) {
          final jobs = this.pendingJobs[index];

          return Card(
            child: ListTile(
              title: Text(
                jobs.pendingJobs.title.split('.').last,
                style: TextStyle(fontSize: 16.0, color: Color(0xFF2F4858)),
              ),
              subtitle: Text(
                jobs.pendingJobs.description,
                style: TextStyle(fontSize: 14.0, color: Color(0xFF5B82AA)),
              ),
              trailing: PendingJobsActions(),
            ),
          );
        });
  }
}
