

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/manage_service/deleteservice_controller.dart';

class DeleteService extends StatelessWidget {
  final DeleteServiceController controller = Get.put(DeleteServiceController());
  final TextEditingController serviceIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: serviceIdController,
              keyboardType: TextInputType.number, // Assuming service ID is numeric
              decoration: InputDecoration(
                labelText: "Enter Service ID to Delete",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Service ID cannot be empty";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Obx(
                  () => ElevatedButton(
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
                onPressed: controller.deletionLoading.value
                    ? null
                    : () {
                  if (serviceIdController.text.isNotEmpty) {
                    int serviceId = int.parse(serviceIdController.text.trim());
                    controller.deleteService(serviceId);
                  }
                },
                child: controller.deletionLoading.value
                    ? CircularProgressIndicator()
                    : Text("Delete Service"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
