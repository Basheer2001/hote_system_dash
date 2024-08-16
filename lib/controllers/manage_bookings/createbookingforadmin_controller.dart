import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminbooking_repo/createbookingforadmin_repo.dart';


class CreateBookingController extends GetxController {
  final CreateBookingForAdminRepo bookingRepo = Get.find<CreateBookingForAdminRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController roomIdController = TextEditingController();
  TextEditingController checkInDateController = TextEditingController();
  TextEditingController checkOutDateController = TextEditingController();
  TextEditingController numAdultsController = TextEditingController();
  TextEditingController numChildrenController = TextEditingController();
  TextEditingController paymentMethodController = TextEditingController();

  var bookingLoadingState = false.obs;

  void createBooking() async {
    if (formKey.currentState!.validate()) {
      bookingLoadingState.value = true;

      AppResponse<Map<String, dynamic>> response = await bookingRepo.createBooking(
        roomId: roomIdController.text,
        checkInDate: checkInDateController.text,
        checkOutDate: checkOutDateController.text,
        numAdults: numAdultsController.text,
        numChildren: numChildrenController.text,
        paymentMethod: paymentMethodController.text,
      );

      bookingLoadingState.value = false;

      if (response.success) {
        Get.defaultDialog(
          title: "Success",
          content: Text("Booking created successfully."),
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
        Get.defaultDialog(
          title: "Error",
          content: Text(response.errorMessage ?? "Unknown error occurred"),
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
}
