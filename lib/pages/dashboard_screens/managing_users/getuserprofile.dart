import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/managinguser_controller/getuserprofile_controller.dart';

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

