import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminbooking_repo/createbookingforadmin_repo.dart';


class CreateBookingForAdminController extends GetxController {
  final CreateBookingForAdminRepo createAdminBookingRepo = Get.find<CreateBookingForAdminRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController roomIdTextController = TextEditingController();
  TextEditingController checkInDateTextController = TextEditingController();
  TextEditingController checkOutDateTextController = TextEditingController();
  TextEditingController numAdultsTextController = TextEditingController();
  TextEditingController numChildrenTextController = TextEditingController();
  TextEditingController paymentMethodTextController = TextEditingController();

  var bookingCreationLoadingState = false.obs;
  var errorMessage = ''.obs;

  void createBooking() async {
    if (formKey.currentState!.validate()) {
      bookingCreationLoadingState.value = true;

      AppResponse<String> response = await createAdminBookingRepo.createBooking(
        roomId: int.parse(roomIdTextController.text),
        checkInDate: checkInDateTextController.text,
        checkOutDate: checkOutDateTextController.text,
        numAdults: int.parse(numAdultsTextController.text),
        numChildren: int.parse(numChildrenTextController.text),
        paymentMethod: paymentMethodTextController.text,
      );

      bookingCreationLoadingState.value = false;

      if (response.success) {
        Get.defaultDialog(
          title: "Success",
          content: Text("Booking created successfully"),
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
}
