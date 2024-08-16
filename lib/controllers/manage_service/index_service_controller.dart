import 'package:dashboardhs/reposetory/dashboard/adminservice/indexservice_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';

class IndexServicesController extends GetxController {
  IndexServicesRepo servicesRepo = Get.find<IndexServicesRepo>();

  var services = <Map<String, dynamic>>[].obs; // Observable list of services
  var loading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchServices(); // Fetch services on initialization
  }

  void fetchServices() async {
    loading.value = true;
    try {
      AppResponse<List<Map<String, dynamic>>> response = await servicesRepo.getAllServices();
      loading.value = false;

      if (response.success) {
        services.assignAll(response.data!);
      } else {
        errorMessage.value = response.errorMessage!;
        Get.defaultDialog(
          title: "Error",
          content: Text(errorMessage.value),
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
    } catch (e) {
      loading.value = false;
      print("Error fetching services: $e");
      errorMessage.value = "Error fetching services";
      Get.defaultDialog(
        title: "Error",
        content: Text(errorMessage.value),
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
