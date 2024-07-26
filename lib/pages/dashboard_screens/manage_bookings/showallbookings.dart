import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/manage_bookings/showallbookings_controller.dart';



class ShowAllBookingsScreen extends StatelessWidget {
  final ShowAllBookingsController bookingController = Get.put(ShowAllBookingsController());

  @override
  Widget build(BuildContext context) {
    bookingController.showallBookings();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Bookings'),
      ),
      body: Obx(() {
        if (bookingController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (bookingController.bookings.isEmpty) {
          return Center(child: Text('No bookings found.'));
        } else {
          return ListView.builder(
            itemCount: bookingController.bookings.length,
            itemBuilder: (context, index) {
              final booking = bookingController.bookings[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(booking.name[0]),
                ),
                title: Text(booking.name),
                subtitle: Text(booking.date.toIso8601String()),
                onTap: () {
                  // Navigate to booking details or perform other actions
                },
              );
            },
          );
        }
      }),
    );
  }
}
