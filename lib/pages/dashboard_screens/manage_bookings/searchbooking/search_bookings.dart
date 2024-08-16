

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/manage_bookings/searchbooking_controller/searchbookings_controller.dart';
import 'bookingfilterpage.dart';

/*class BookingSearch extends StatelessWidget {
  final BookingSearchController controller = Get.find<BookingSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Bookings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.roomidTextController,
                decoration: InputDecoration(
                  labelText: 'Room ID',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a room ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.searchBookings,
                child: Text('Search'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Adjust padding as needed
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (controller.books.isEmpty) {
                  return Center(child: Text('No bookings available'));
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.books.length,
                    itemBuilder: (context, index) {
                      final booking = controller.books[index];
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID: ${booking.id}'),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}*/


class BookingSearch extends StatelessWidget {
  final BookingSearchController bookingSearchController = Get.find<BookingSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search For Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: bookingSearchController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: bookingSearchController.roomIdController,
                decoration: InputDecoration(
                  labelText: 'Room ID',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Room ID';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: bookingSearchController.searchBookings,
                child: Text('Search'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Obx(() {
                if (bookingSearchController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (bookingSearchController.bookings.isEmpty) {
                  return Center(child: Text('No bookings available'));
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: bookingSearchController.bookings.length,
                    itemBuilder: (context, index) {
                      final booking = bookingSearchController.bookings[index];
/*
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
*/

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
                              SizedBox(height: 16), // Add some space before the button
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                  //  Get.to(() => BookingFilterPage());
                                  },
                                  child: Text('Filter'),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );

                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

