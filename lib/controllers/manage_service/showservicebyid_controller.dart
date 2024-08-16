


import 'package:dashboardhs/reposetory/dashboard/adminservice/showservicebyid_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';

class ShowServiceByIdController extends GetxController {
  final ShowServiceByIdRepo serviceRepo = Get.find<ShowServiceByIdRepo>();

  var serviceData = {}.obs;
  var serviceLoadingState = false.obs;
  var errorMessage = ''.obs;

  void fetchServiceById(int serviceId) async {
    serviceLoadingState.value = true;

    try {
      AppResponse<Map<String, dynamic>> response = await serviceRepo.getServiceById(serviceId: serviceId);

      serviceLoadingState.value = false;

      if (response.success) {
        serviceData.value = response.data ?? {};
      } else {
        errorMessage.value = response.errorMessage ?? "Unknown error occurred";
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
      serviceLoadingState.value = false;
      print("Error fetching service: $e");
      errorMessage.value = "Error fetching service";
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
