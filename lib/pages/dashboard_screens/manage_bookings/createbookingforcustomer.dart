

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
                decoration: InputDecoration(labelText: 'Room ID'),
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
                decoration: InputDecoration(labelText: 'Check-in Date'),
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
                decoration: InputDecoration(labelText: 'Check-out Date'),
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
                decoration: InputDecoration(labelText: 'Number of Adults'),
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
                decoration: InputDecoration(labelText: 'Number of Children'),
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
                decoration: InputDecoration(labelText: 'Payment Method'),
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
