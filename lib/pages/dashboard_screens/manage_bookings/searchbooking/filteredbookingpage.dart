import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/manage_bookings/searchbooking_controller/filterbookingpage_controller.dart';

/*class FilteredBookingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BookingFilterController filterController = Get.find<BookingFilterController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Bookings'),
      ),
      body: Obx(() {
        if (filterController.filteredBookings.isEmpty) {
          return Center(child: Text('No bookings found'));
        }

        return ListView.builder(
          itemCount: filterController.filteredBookings.length,
          itemBuilder: (context, index) {
            final booking = filterController.filteredBookings[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking ID: ${booking.id}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('User ID: ${booking.userId}'),
                    Text('Room ID: ${booking.roomId}'),
                    Text('Check-in Date: ${booking.checkInDate}'),
                    Text('Check-out Date: ${booking.checkOutDate}'),
                    Text('Adults: ${booking.numAdults}'),
                    Text('Children: ${booking.numChildren}'),
                    Text('Payment Status: ${booking.paymentStatus}'),
                    Text('Payment Method: ${booking.paymentMethod}'),
                    Text('Created At: ${booking.createdAt}'),
                    Text('Updated At: ${booking.updatedAt}'),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}*/
