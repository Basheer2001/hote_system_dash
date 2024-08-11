


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminbooking_repo/updatepaymentstatue_repo.dart';
//
class BookingDetailsController extends GetxController {
  final UpdateBookingStatueRepo updateBookingStatueRepo = Get.find<UpdateBookingStatueRepo>();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();


  var loading = false.obs;
  var errorMessage = ''.obs;


  Future<void> updatePaymentStatus(int bookingId, String status) async {
    loading.value = true;
    AppResponse<void> response = await updateBookingStatueRepo.updatePaymentStatus(bookingId, status);
    loading.value = false;

    if (response.success) {
      Get.defaultDialog(
        title: "Success",
        content: Text("Payment status updated successfully"),
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