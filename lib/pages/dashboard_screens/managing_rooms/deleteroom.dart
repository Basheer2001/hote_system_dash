import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/managingrooms_controller/cdroom_controller.dart';
import '../../../controllers/managingrooms_controller/deleteroom_controller.dart';
 // Adjust import based on your project structure

/*
class AdminDeleteRoom extends StatelessWidget {
  final DeleteRoomController controller = Get.put(DeleteRoomController());
  final TextEditingController roomNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Room'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete_outline,
                size: 72,
                color: Colors.red,
              ),
              SizedBox(height: 24.0),
              Text(
                'Delete Room',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24.0),
              TextField(
                controller: roomNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Room Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  _showConfirmationDialog(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Button color
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  ),
                ),
                child: Text('Confirm Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Deletion"),
          content: Text("Are you sure you want to delete room ${roomNumberController.text}?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Get.back();
              },
            ),
            ElevatedButton(
              child: Text("Delete"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Button color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
              ),
              onPressed: () {
                int roomId = int.tryParse(roomNumberController.text) ?? 0; // Convert entered text to integer
                controller.deleteRoom(); // Pass the room ID to delete
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
*/

class DeleteRoom extends StatelessWidget {
  final DeleteRoomController controller = Get.put(DeleteRoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Room'),
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
                  return "Room ID cannot be empty";
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
                    : Text("Delete Room"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
