import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/managingreports_controller/showsomeonereport_controller.dart'; // Adjust this import as per your project structure

class ShowSomeonereportScreen extends StatelessWidget {
  final int userId;
  final ShowSomeonereportController controller = Get.put(ShowSomeonereportController());

  ShowSomeonereportScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    controller.fetchUserReports(userId);

    return Scaffold(
      appBar: AppBar(
        title: Text("User Reports"),
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return ListView.builder(
            itemCount: controller.reportsList.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> report = controller.reportsList[index];
              return ListTile(
                title: Text(report['title']),
                subtitle: Text(report['text_description']),
                trailing: report['is_checked'] == 1 ? Icon(Icons.check) : Icon(Icons.close),
              );
            },
          );
        }
      }),
    );
  }
}
