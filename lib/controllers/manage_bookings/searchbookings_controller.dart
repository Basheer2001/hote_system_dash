
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';
import '../../pages/dashboard_screens/manage_bookings/bookingclass.dart';
import '../../reposetory/dashboard/adminbooking_repo/searchbookings_repo.dart';

class BookingSearchController extends GetxController {
  SearchBookingsRepo searchBookingsRepo = Get.find<SearchBookingsRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController useridTextController = TextEditingController();
  TextEditingController roomidTextController = TextEditingController();
  TextEditingController checkinTextController = TextEditingController();
  TextEditingController checkoutTextController = TextEditingController();
  TextEditingController paymentstatueTextController = TextEditingController();
  TextEditingController paymentmethodTextController = TextEditingController();


  var isLoading = false.obs;
  var books = <Booking>[].obs;

  void searchBookings() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      String user_id = useridTextController.text;
      String room_id = roomidTextController.text;
      String check_in_date=checkinTextController.text;
      String check_out_date=checkoutTextController.text;
      String payment_status= paymentstatueTextController.text;
      String payment_method=paymentmethodTextController.text;

      AppResponse<List<Booking>> response = await searchBookingsRepo.searchBookings(
          user_id,
          room_id,
          check_in_date,
          check_out_date,
          payment_status,
          payment_method,
      );

      isLoading.value = false;

      if (response.success) {
        books.assignAll(response.data!);
      } else {
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