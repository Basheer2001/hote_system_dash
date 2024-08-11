
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/manage_bookings/bookingdetails_controller.dart';


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
                         /* DataCell(Text("${booking.userId}")),
                          DataCell(Text("${booking.roomId}")),
                          DataCell(Text("${booking.checkInDate}")),
                          DataCell(Text("${booking.checkOutDate}")),
                          DataCell(Text("${booking.numAdults}")),
                          DataCell(Text("${booking.numChildren}")),
                          DataCell(Text("${booking.paymentSessionId}")),
                          DataCell(Text("${booking.paymentStatus}")),
                          DataCell(Text("${booking.paymentMethod}")),
                          DataCell(Text("${booking.createdAt}")),
                          DataCell(Text("${booking.updatedAt}")),*/
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
