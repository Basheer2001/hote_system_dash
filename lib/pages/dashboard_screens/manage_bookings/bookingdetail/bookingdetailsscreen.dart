import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/manage_bookings/bookingdetails_controller.dart';
import 'bookingmodel.dart';


class ShowBookingDetailsScreen extends StatelessWidget {
  final TextEditingController bookingIdController = TextEditingController();
  final ShowBookingDetailsController bookingDetailsController = Get.put(ShowBookingDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            TextField(
              controller: bookingIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Booking ID",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String bookingIdStr = bookingIdController.text;
                if (bookingIdStr.isNotEmpty) {
                  int bookingId = int.tryParse(bookingIdStr) ?? -1;
                  if (bookingId > 0) {
                    bookingDetailsController.fetchBookingDetails(bookingId);
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please enter a valid Booking ID',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                } else {
                  Get.snackbar(
                    'Error',
                    'Please enter a Booking ID',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              child: Text('Get Booking Details'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (bookingDetailsController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (bookingDetailsController.bookingDetails.value != null) {
                BookingDetails details = bookingDetailsController.bookingDetails.value!;
                return Expanded(
                  child: ListView(
                    children: [
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Booking ID: ${details.id}', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text('User Name: ${details.user.firstName} ${details.user.lastName}'),
                              Text('Room Number: ${details.room.roomNumber}'),
                              Text('Check-in Date: ${details.checkInDate}'),
                              Text('Check-out Date: ${details.checkOutDate}'),
                              Text('Payment Status: ${details.paymentStatus}'),
                              // Add more fields as necessary...
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text('Enter a Booking ID to see details.');
              }
            }),
          ],
        ),
      ),
    );
  }
}







/*
class AdminBookingDetails extends StatelessWidget {
  final AdminBookingController controller = Get.put(AdminBookingController());

  @override
  Widget build(BuildContext context) {
    final int bookingId = 1; // Example booking ID
    controller.fetchBookingDetails(bookingId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.bookingDetail.value == null) {
            return Center(child: Text('No booking details available'));
          } else {
            final booking = controller.bookingDetail.value!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Basic Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    child: DataTable(
                      columnSpacing: 30,
                      headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.grey.shade200),
                      columns: [
                        DataColumn(label: Text("ID")),
                        DataColumn(label: Text("User ID")),
                        DataColumn(label: Text("Room ID")),
                        DataColumn(label: Text("Check-In Date")),
                        DataColumn(label: Text("Check-Out Date")),
                        DataColumn(label: Text("Number of Adults")),
                        DataColumn(label: Text("Number of Children")),
                        DataColumn(label: Text("Payment Session ID")),
                        DataColumn(label: Text("Payment Status")),
                        DataColumn(label: Text("Payment Method")),
                        DataColumn(label: Text("Created At")),
                        DataColumn(label: Text("Updated At")),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("${booking.id}")),

                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
*/