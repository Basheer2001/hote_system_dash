import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/managingreports_controller/checkmultiplereports_controller.dart';



class ReportUpdateScreen extends StatelessWidget {
  final CheckMultipleReportsController reportUpdateController = Get.put(CheckMultipleReportsController());
 TextEditingController useridcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Reports'),
      ),
      body: Center(
        child: Obx(() {
          if (reportUpdateController.isLoading.value) {
            return CircularProgressIndicator();
          } else if (reportUpdateController.errorMessage.value.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  reportUpdateController.errorMessage.value,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: useridcontroller,
                  style:TextStyle(

                  ),

                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    reportUpdateController.updateReports(useridcontroller.text);
                  },
                  child: Text('Retry'),
                ),
              ],
            );
          } else if (reportUpdateController.successMessage.value.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  reportUpdateController.successMessage.value,
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: useridcontroller,
                  style:TextStyle(

                  ),

                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    reportUpdateController.updateReports(useridcontroller.text);
                  },
                  child: Text('Update Reports Again'),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: useridcontroller,
                  style:TextStyle(

                  ),

                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    reportUpdateController.updateReports(useridcontroller.text);
                  },
                  child: Text('Update Reports'),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
