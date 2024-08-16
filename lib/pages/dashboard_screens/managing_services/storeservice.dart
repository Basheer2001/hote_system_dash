

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../../controllers/manage_service/storeservice_controller.dart';

class StoreService extends GetView<StoreServiceController> {
  const StoreService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StoreServiceController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.nameTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Service Name",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.descriptionTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Description",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.priceTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "Enter a valid price";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Price",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.durationTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "Enter a valid duration";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Duration (in hours)",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                        () => ElevatedButton(
                      onPressed: () {
                        controller.createService();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20), // Adjust padding as needed
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: controller.createServiceLoadingState.value
                          ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Text(
                        "Create Service",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
