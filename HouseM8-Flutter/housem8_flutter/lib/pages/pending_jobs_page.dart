import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:housem8_flutter/helpers/connection_helper.dart';
import 'package:housem8_flutter/view_models/pending_job_list_view_model.dart';
import 'package:housem8_flutter/view_models/pending_job_view_model.dart';
import 'package:housem8_flutter/widgets/mate_app_bar.dart';
import 'package:housem8_flutter/widgets/offline_message.dart';
import 'package:housem8_flutter/widgets/pending_jobs_list.dart';
import 'package:provider/provider.dart';

class PendingJobsScreen extends StatefulWidget {
  @override
  _PendingJobsScreenState createState() => _PendingJobsScreenState();
}

class _PendingJobsScreenState extends State<PendingJobsScreen> {
  List<PendingJobViewModel> pendingJobs = List<PendingJobViewModel>();
  bool isDeviceConnected = true;
  var internetConnection;

  @override
  void initState() {
    super.initState();

    //Verificar Conectividade
    ConnectionHelper.checkConnection().then((value) {
      isDeviceConnected = value;
      if (isDeviceConnected) {
        getDataFromService();
      }
    });

    //Ativar listener para caso a conectividade mude
    internetConnection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        isDeviceConnected = await DataConnectionChecker().hasConnection;
        if (isDeviceConnected) {
          getDataFromService();
        }
      } else {
        isDeviceConnected = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isDeviceConnected) {
      return Scaffold(
        appBar: MateAppBar("Trabalhos Pendentes", false),
        body: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: PendingJobsList(
                pendingJobs: pendingJobs,
              )),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: MateAppBar("Trabalhos Pendentes", false),
          body: OfflineMessage());
    }
  }

  void getDataFromService() {
    final vm = Provider.of<PendingJobListViewModel>(context, listen: false);
    vm.fetchPendingJob().then((value) {
      pendingJobs = vm.pendingJobs;
      setState(() {});
    });
  }

  @override
  void dispose() {
    internetConnection.cancel();
    super.dispose();
  }
}
