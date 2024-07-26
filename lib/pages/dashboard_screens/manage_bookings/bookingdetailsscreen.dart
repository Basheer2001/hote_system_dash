
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/manage_bookings/bookingdetails_controller.dart';


class BookingDetailsScreen extends StatelessWidget {
  final int bookingId;

  BookingDetailsScreen({required this.bookingId});

  final BookingDetailsController bookingDetailsController = Get.put(BookingDetailsController());

  @override
  Widget build(BuildContext context) {
    bookingDetailsController.fetchBookingDetails(bookingId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
      ),
      body: Obx(() {
        if (bookingDetailsController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (bookingDetailsController.bookingDetails.value == null) {
          return Center(child: Text('Failed to load booking details'));
        } else {
          final booking = bookingDetailsController.bookingDetails.value!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Booking ID: ${booking.id}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Name: ${booking.name}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text('Date: ${booking.date.toIso8601String()}', style: TextStyle(fontSize: 16)),
                // Add more fields as necessary
              ],
            ),
          );
        }
      }),
    );
  }
}
