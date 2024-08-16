import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminreport_repo/showsomeonereport_repo.dart';

class ShowSomeonereportController extends GetxController {
  ShowSomeonereportRepo userReportsRepo = Get.find<ShowSomeonereportRepo>(); // Assuming you have registered UserReportsRepo

  var reportsList = <Map<String, dynamic>>[].obs;
  var loading = false.obs;
  var errorMessage = ''.obs;

  void fetchUserReports(String userId) async {
    loading.value = true;
    AppResponse<List<Map<String, dynamic>>> response = await userReportsRepo.getUserReports(userId);
    loading.value = false;

    if (response.success) {
      reportsList.assignAll(response.data!);
    } else {
      errorMessage.value = response.errorMessage!;
      Get.defaultDialog(
        title: "Error",
        content: Text(response.errorMessage!),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
    }
  }
}
