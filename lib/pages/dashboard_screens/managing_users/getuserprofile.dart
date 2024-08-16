import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/managinguser_controller/getuserprofile_controller.dart';

/*
class GetUserProfileScreen extends StatelessWidget {
  final int userId;

  GetUserProfileScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetUserProfileController());

    // Fetch user profile data
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      controller.getUserProfile(userId);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID: ${controller.profileData['id']}"),
                Text("Name: ${controller.profileData['first_name']} ${controller.profileData['last_name']}"),
                Text("Phone: ${controller.profileData['phone']}"),
                Text("Address: ${controller.profileData['address']}"),
                Text("Personal ID: ${controller.profileData['personal_id']}"),
                // Add other fields as necessary
              ],
            ),
          );
        }
      }),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetUserProfileScreen extends StatelessWidget {
  GetUserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetUserProfileController());
    final TextEditingController idController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: "Enter User ID",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                int? userId = int.tryParse(idController.text);
                if (userId != null) {
                  controller.getUserProfile(userId);
                } else {
                  Get.defaultDialog(
                    title: "Invalid Input",
                    content: Text("Please enter a valid User ID"),
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
              child: Text("Get Profile"),
            ),
            SizedBox(height: 32),
            Obx(() {
              if (controller.loading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.errorMessage.value.isNotEmpty) {
                return Center(child: Text(controller.errorMessage.value));
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID: ${controller.profileData['id']}"),
                    Text(
                        "Name: ${controller.profileData['first_name']} ${controller.profileData['last_name']}"),
                    Text("Phone: ${controller.profileData['phone']}"),
                    Text("Address: ${controller.profileData['address']}"),
                    Text("Personal ID: ${controller.profileData['personal_id']}"),
                    // Add other fields as necessary
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

