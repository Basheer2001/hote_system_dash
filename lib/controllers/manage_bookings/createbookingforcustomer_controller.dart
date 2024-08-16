import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminbooking_repo/bookingforcustomer_repo.dart';


/*
class CreateBookingForCustomerController extends GetxController {
  final CreateBookingForCustomerRepo createAdminBookingRepo = Get.find<CreateBookingForCustomerRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController userIdTextController = TextEditingController();
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

      AppResponse<String> response = await createAdminBookingRepo.createBookingForCustomer(
        userId: userIdTextController.text,
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
*/

class CreateBookingForCustomerController extends GetxController {
  final BookingForCustomerRepo bookingRepo = Get.find<BookingForCustomerRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userIdController = TextEditingController();
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
        checkInDate: checkInDateController.text,
        checkOutDate: checkOutDateController.text,
        numAdults: numAdultsController.text,
        numChildren: numChildrenController.text,
        paymentMethod: paymentMethodController.text,
        userId: userIdController.text,
        roomId: roomIdController.text,
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
