import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminservice/updateservice_repo.dart';
// Adjust the path as needed

class UpdateServiceController extends GetxController {
  final UpdateServiceRepo updateServiceRepo = Get.find<UpdateServiceRepo>();

  // Observables
  var loading = false.obs;
  var responseMessage = ''.obs;
  var errorMessage = ''.obs;

  // Method to update a service
  Future<void> updateService({
    required int serviceId,
    required String name,
    required String description,
    required String price,
    required String duration,
  }) async {
    loading.value = true;
    try {
      // Call the repository method to update the service
      AppResponse<Map<String, dynamic>> response = await updateServiceRepo.updateService(
        serviceId: serviceId,
        name: name,
        description: description,
        price: price,
        duration: duration,
      );

      if (response.success) {
        responseMessage.value = response.data?["msg"] ?? "Service updated successfully.";
        // Show success dialog or message
        Get.defaultDialog(
          title: "Success",
          content: Text(responseMessage.value),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      } else {
        // Handle error message
        errorMessage.value = response.errorMessage!;
        Get.defaultDialog(
          title: "Error",
          content: Text(errorMessage.value),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      }
    } catch (e) {
      // Handle unexpected errors
      errorMessage.value = e.toString();
      Get.defaultDialog(
        title: "Error",
        content: Text(errorMessage.value),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close dialog
            },
            child: Text("OK"),
          ),
        ],
      );
    } finally {
      loading.value = false;
    }
  }
}
