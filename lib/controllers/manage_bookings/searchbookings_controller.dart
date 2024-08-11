
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';
import '../../pages/dashboard_screens/manage_bookings/bookingclass.dart';
import '../../reposetory/dashboard/adminbooking_repo/searchbookings_repo.dart';

class BookingSearchController extends GetxController {
  final SearchBookingsRepo searchBookingsRepo = Get.find<SearchBookingsRepo>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController roomidTextController = TextEditingController();

  var isLoading = false.obs;
  var bookings = <Booking>[].obs;

  void searchBookings() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      String roomId = roomidTextController.text;

      try {
        AppResponse<List<Booking>> response = await searchBookingsRepo.searchBookings(roomId);
        isLoading.value = false;

        if (response.success) {
          bookings.assignAll(response.data!);
        } else {
          _showErrorDialog(response.errorMessage!);
        }
      } catch (e) {
        isLoading.value = false;
        _showErrorDialog("Error searching bookings");
      }
    }
  }
//
  void _showErrorDialog(String message) {
    Get.defaultDialog(
      title: "Error",
      content: Text(message),
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
