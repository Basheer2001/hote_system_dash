

import 'package:dio/dio.dart'as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/manage_service/showservicebyid_controller.dart';
import '../../../contsant/sharedprefrences/shared.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
class ShowServiceByIdPage extends StatelessWidget {
  final TextEditingController serviceIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final ShowServiceByIdController controller = Get.put(ShowServiceByIdController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: serviceIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Service ID',
                border: OutlineInputBorder(),
                hintText: 'Service ID',
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  int serviceId = int.parse(value);
                  controller.fetchServiceById(serviceId);
                }
              },
            ),
            SizedBox(height: 20),
            Obx(() {
              if (controller.serviceLoadingState.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.errorMessage.value.isNotEmpty) {
                return Center(child: Text(controller.errorMessage.value));
              }

              if (controller.serviceData.isEmpty) {
                return Center(child: Text("No service data available."));
              }

              final service = controller.serviceData;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${service['name'] ?? 'N/A'}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text("Description: ${service['description'] ?? 'N/A'}", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text("Price: ${service['price'] ?? 'N/A'}", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text("Duration: ${service['duration'] ?? 'N/A'}", style: TextStyle(fontSize: 16)),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
*/


class ShowServiceByIdPage extends StatelessWidget {
  final TextEditingController serviceIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final ShowServiceByIdController controller = Get.put(ShowServiceByIdController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: serviceIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Service ID',
                border: OutlineInputBorder(),
                hintText: 'Service ID',
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
                if (serviceIdController.text.isNotEmpty) {
                  int serviceId = int.parse(serviceIdController.text);
                  controller.fetchServiceById(serviceId);
                }
              },
              child: Text('Fetch Service Details'),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (controller.serviceLoadingState.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.errorMessage.value.isNotEmpty) {
                return Center(child: Text(controller.errorMessage.value));
              }

              if (controller.serviceData.isEmpty) {
                return Center(child: Text("No service data available."));
              }

              final service = controller.serviceData;

              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${service['name'] ?? 'N/A'}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("Description: ${service['description'] ?? 'N/A'}", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text("Price: ${service['price'] ?? 'N/A'}", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text("Duration: ${service['duration'] ?? 'N/A'}", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
