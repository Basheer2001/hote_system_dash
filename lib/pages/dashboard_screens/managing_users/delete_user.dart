import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/managinguser_controller/deleteuser_controller.dart';


class DeleteUser extends StatelessWidget {
  final DeleteUserController controller = Get.put(DeleteUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: controller.userIdController,
              keyboardType: TextInputType.number, // Assuming user ID is numeric
              decoration: InputDecoration(
                labelText: "Enter User number you want to delete",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "User ID cannot be empty";
                }
                // You can add additional validation logic if needed
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
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Adjust padding as needed
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
                  if (controller.userIdController.text.isNotEmpty) {
                    controller.deleteUser();
                  }
                },
                child: controller.deletionLoading.value
                    ? CircularProgressIndicator()
                    : Text("Delete User"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
