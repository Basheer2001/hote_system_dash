import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/manage_bookings/bookingdetails_controller.dart';

class UpdateBookingStatue extends StatelessWidget {
  const UpdateBookingStatue({super.key});

  @override
  Widget build(BuildContext context) {
    final BookingDetailsController controller = Get.put(BookingDetailsController());
    String selectedStatus = 'Pending';  // Default status

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Payment Status'),
      ),

    );
  }
}