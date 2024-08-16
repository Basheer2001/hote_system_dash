

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminservice/deleteservice_repo.dart';

class DeleteServiceController extends GetxController {
  final DeleteServiceRepo deleteServiceRepo = Get.find<DeleteServiceRepo>();

  var deletionLoading = false.obs;
  var responseMessage = ''.obs;
  var errorMessage = ''.obs;

  void deleteService(int serviceId) async {
    deletionLoading.value = true;
    try {
      AppResponse<void> response = await deleteServiceRepo.deleteService(serviceId);

      if (response.success) {
        responseMessage.value = 'Service deleted successfully'; // Custom message for success
        Get.defaultDialog(
          title: "Success",
          content: Text(responseMessage.value),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                // Optionally, navigate back to the previous screen or refresh the list
              },
              child: Text("OK"),
            ),
          ],
        );
      } else {
        // Handle error
        throw Exception(response.errorMessage ?? 'Failed to delete service');
      }
    } catch (e) {
      errorMessage.value = e.toString();
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
    } finally {
      deletionLoading.value = false;
    }
  }
}
