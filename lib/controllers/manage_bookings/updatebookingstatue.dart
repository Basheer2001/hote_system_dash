


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminbooking_repo/updatepaymentstatue_repo.dart';

class PaymentStatusController extends GetxController {
  PaymentStatusRepo paymentStatusRepo = Get.find<PaymentStatusRepo>();

  var responseMessage = ''.obs;
  var loading = false.obs;
  var errorMessage = ''.obs;

  Future<void> updatePaymentStatus(String bookingId, String paymentStatus) async {
    loading.value = true;
    AppResponse<Map<String, dynamic>> response = await paymentStatusRepo.updatePaymentStatus(bookingId, paymentStatus);
    loading.value = false;

    if (response.success) {
      responseMessage.value = response.data!["msg"] ?? "Payment status updated successfully.";
      Get.defaultDialog(
        title: "Success",
        content: Text(responseMessage.value),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
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
  }
}
