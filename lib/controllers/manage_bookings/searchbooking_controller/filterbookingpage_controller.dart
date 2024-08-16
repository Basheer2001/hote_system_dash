import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../pages/dashboard_screens/manage_bookings/searchbooking/searchbookingmodel.dart';

/*class BookingFilterController extends GetxController {
  final List<Booking> allBookings;

  BookingFilterController(this.allBookings);

  TextEditingController userIdController = TextEditingController();
  var selectedPaymentMethod = 'cash'.obs;
  TextEditingController numAdultsController = TextEditingController();
  TextEditingController numChildrenController = TextEditingController();

  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  var filteredBookings = <Booking>[].obs;

  void setDateRange(DateTimeRange dateRange) {
    startDate.value = dateRange.start;
    endDate.value = dateRange.end;
  }

  void filterBookings() {
    String? userId = userIdController.text.isNotEmpty ? userIdController.text : null;
    String? paymentMethod = selectedPaymentMethod.value.isNotEmpty ? selectedPaymentMethod.value : null;
    int? numAdults = numAdultsController.text.isNotEmpty ? int.tryParse(numAdultsController.text) : null;
    int? numChildren = numChildrenController.text.isNotEmpty ? int.tryParse(numChildrenController.text) : null;
    DateTime? start = startDate.value;
    DateTime? end = endDate.value;

    filteredBookings.value = allBookings.where((booking) {
      bool matches = true;

      if (userId != null) {
        matches = matches && booking.userId.toString() == userId;
      }
      if (paymentMethod != null) {
        matches = matches && booking.paymentMethod == paymentMethod;
      }
      if (numAdults != null) {
        matches = matches && booking.numAdults == numAdults;
      }
      if (numChildren != null) {
        matches = matches && booking.numChildren == numChildren;
      }
      if (start != null && end != null) {
        DateTime checkIn = DateTime.parse(booking.checkInDate);
        DateTime checkOut = DateTime.parse(booking.checkOutDate);

        matches = matches && checkIn.isAfter(start) && checkOut.isBefore(end);
      }

      return matches;
    }).toList();
  }
}*/
