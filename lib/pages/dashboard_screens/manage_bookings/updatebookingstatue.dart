import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/manage_bookings/updatebookingstatue.dart';

class UpdatePaymentStatusPage extends StatelessWidget {
  final TextEditingController bookingIdController = TextEditingController();
  final TextEditingController paymentStatusController = TextEditingController();
  final PaymentStatusController controller = Get.find<PaymentStatusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Payment Status'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              // Booking ID Field
              TextField(
                controller: bookingIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter the booking ID",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                ),
              ),
              SizedBox(height: 20),
              // Payment Status Field
              TextField(
                controller: paymentStatusController,
                decoration: InputDecoration(
                  labelText: "Enter new payment status",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                ),
              ),
              SizedBox(height: 20),
              // Submit Button
              ElevatedButton(
                onPressed: () {
                  String bookingId = bookingIdController.text;
                  String paymentStatus = paymentStatusController.text;
                  if (bookingId.isNotEmpty && paymentStatus.isNotEmpty) {
                    controller.updatePaymentStatus(bookingId, paymentStatus);
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please enter a valid Booking ID and Payment Status',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: Text('Update Payment Status'),
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
            ],
          ),
        ),
      ),
    );
  }
}
