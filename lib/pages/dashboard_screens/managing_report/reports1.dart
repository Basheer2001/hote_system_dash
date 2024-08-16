import 'package:dashboardhs/pages/dashboard_screens/managing_report/reportclass.dart';
import 'package:dashboardhs/pages/dashboard_screens/managing_report/showactivereports.dart';
import 'package:dashboardhs/pages/dashboard_screens/managing_report/showsomeonereport.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/managingreports_controller/checkmultiplereports_controller.dart';
import '../../../controllers/managingreports_controller/showactivereport_controller.dart';
import 'checkmultipereports.dart';


class Reports extends StatelessWidget {
  final ReportController reportsController = Get.put(ReportController());
   TextEditingController useridcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Call fetchReports when this widget is built
    reportsController.fetchReports();

    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),

      ),
      body: Center(
        child:   Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to(() =>ShowActiveReports( ));
            }, child: Text("ShowActiveReports")),
            SizedBox(height: 20),
            TextFormField(
              controller: useridcontroller,
              style:TextStyle(

              ),

            ),
            SizedBox(height: 20),

            ElevatedButton(onPressed: (){
              Get.to(() =>ShowSomeonereportScreen(userId: useridcontroller.text, ));
            }, child: Text("Show someone report")),

            SizedBox(height: 20),

            ElevatedButton(onPressed: (){Get.to(() =>ReportUpdateScreen( ));
            }, child: Text("CheckMultipleReportsController")),
          ],
        ),
      ),
    );
  }
}