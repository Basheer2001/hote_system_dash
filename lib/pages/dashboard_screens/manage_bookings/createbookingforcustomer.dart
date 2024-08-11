

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/manage_bookings/createbookingforcustomer_controller.dart';

class CreateBookingForCustomer extends StatelessWidget {
  final CreateBookingForCustomerController controller = Get.put(CreateBookingForCustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.roomIdTextController,
                decoration: InputDecoration(labelText: 'Room ID',  border: OutlineInputBorder(),),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Room ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.checkInDateTextController,
                decoration: InputDecoration(labelText: 'Check-in Date',  border: OutlineInputBorder(),),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Check-in Date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.checkOutDateTextController,
                decoration: InputDecoration(labelText: 'Check-out Date',  border: OutlineInputBorder(),),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Check-out Date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.numAdultsTextController,
                decoration: InputDecoration(labelText: 'Number of Adults',  border: OutlineInputBorder(),),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Number of Adults';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.numChildrenTextController,
                decoration: InputDecoration(labelText: 'Number of Children',  border: OutlineInputBorder(),),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Number of Children';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.paymentMethodTextController,
                decoration: InputDecoration(labelText: 'Payment Method',  border: OutlineInputBorder(),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Payment Method';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Obx(() {
                if (controller.bookingCreationLoadingState.value) {
                  return CircularProgressIndicator();
                } else {
                  return ElevatedButton(
                    onPressed: controller.createBooking,
                    child: Text('Create Booking'),
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
                  );
                }
              }),
              Obx(() {
                if (controller.errorMessage.isNotEmpty) {
                  return Text(
                    controller.errorMessage.value,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
