import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminbooking_repo/bookingforcustomer_repo.dart';

class BookingForCustomerController extends GetxController {
  final BookingForCustomerRepo bookingRepo = Get.find<BookingForCustomerRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController roomIdController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
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
        userId: userIdController.text,
        checkInDate: checkInDateController.text,
        checkOutDate: checkOutDateController.text,
        numAdults:numAdultsController.text,
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
