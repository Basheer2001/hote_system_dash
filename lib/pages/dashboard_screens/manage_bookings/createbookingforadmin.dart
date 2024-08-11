import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/manage_bookings/createbookingforadmin_controller.dart';

class CreateBookingForAdmin extends StatelessWidget {
  final CreateBookingController controller = Get.put(CreateBookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Booking")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.roomIdController,
                decoration: InputDecoration(labelText: "Room ID",  border: OutlineInputBorder(),),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? "Room ID is required" : null,
              ),
              TextFormField(
                controller: controller.checkInDateController,
                decoration: InputDecoration(labelText: "Check-In Date",  border: OutlineInputBorder(),),
                validator: (value) => value!.isEmpty ? "Check-In Date is required" : null,
              ),
              TextFormField(
                controller: controller.checkOutDateController,
                decoration: InputDecoration(labelText: "Check-Out Date",  border: OutlineInputBorder(),),
                validator: (value) => value!.isEmpty ? "Check-Out Date is required" : null,
              ),
              TextFormField(
                controller: controller.numAdultsController,
                decoration: InputDecoration(labelText: "Number of Adults",  border: OutlineInputBorder(),),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? "Number of Adults is required" : null,
              ),
              TextFormField(
                controller: controller.numChildrenController,
                decoration: InputDecoration(labelText: "Number of Children",  border: OutlineInputBorder(),),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? "Number of Children is required" : null,
              ),
              TextFormField(
                controller: controller.paymentMethodController,
                decoration: InputDecoration(labelText: "Payment Method",  border: OutlineInputBorder(),),
                validator: (value) => value!.isEmpty ? "Payment Method is required" : null,
              ),
              SizedBox(height: 20),
              Obx(() => controller.bookingLoadingState.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: controller.createBooking,
                child: Text("Create Booking"),
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
              )),
            ],
          ),
        ),
      ),
    );
  }
}
