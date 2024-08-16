
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/manage_service/updateservice_controller.dart';

/*
class UpdateServicePage extends StatelessWidget {
  final int serviceId;

  UpdateServicePage({required this.serviceId});

  @override
  Widget build(BuildContext context) {
    final UpdateServiceController controller = Get.put(UpdateServiceController());

    // Form fields controllers
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController durationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Service'),
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Service Name',  border: OutlineInputBorder(),),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description',  border: OutlineInputBorder(),),
              ),
              SizedBox(height: 10),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price',  border: OutlineInputBorder(),),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: durationController,
                decoration: InputDecoration(labelText: 'Duration',  border: OutlineInputBorder(),),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  ),
                ),
                onPressed: () {
                  controller.updateService(
                    serviceId: serviceId,
                    name: nameController.text,
                    description: descriptionController.text,
                    price: priceController.text,
                    duration: durationController.text,
                  );
                },
                child: Text("Update Service"),
              ),
              if (controller.responseMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    controller.responseMessage.value,
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              if (controller.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    controller.errorMessage.value,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UpdateServiceController controller = Get.put(UpdateServiceController());

    // Form fields controllers
    final TextEditingController serviceIdController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController durationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Service'),
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: serviceIdController,
                decoration: InputDecoration(
                  labelText: 'Service ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Service Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: durationController,
                decoration: InputDecoration(
                  labelText: 'Duration',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  ),
                ),
                onPressed: () {
                  int? serviceId = int.tryParse(serviceIdController.text);
                  if (serviceId != null) {
                    controller.updateService(
                      serviceId: serviceId,
                      name: nameController.text,
                      description: descriptionController.text,
                      price: priceController.text,
                      duration: durationController.text,
                    );
                  } else {
                    Get.defaultDialog(
                      title: "Invalid Input",
                      content: Text("Please enter a valid Service ID"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  }
                },
                child: Text("Update Service"),
              ),
              if (controller.responseMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    controller.responseMessage.value,
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              if (controller.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    controller.errorMessage.value,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
