import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminbooking_repo/downloadinvocierepo.dart';
import '../../reposetory/dashboard/adminuser_repo/viewallusers_repo.dart';

class ViewAllUsersController extends GetxController {
  ViewAllUsersRepo userRepo = Get.find<ViewAllUsersRepo>();


  var users = <Map<String, dynamic>>[].obs; // Observable list of users
  var loading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers(); // Fetch users on initialization
  }

  void fetchUsers() async {
    loading.value = true;
    try {
      AppResponse<List<Map<String, dynamic>>> response = await userRepo.getAllusers();
      loading.value = false;

      if (response.success) {
        users.assignAll(response.data!);
      } else {
        errorMessage.value = response.errorMessage!;
        Get.defaultDialog(
          title: "Error",
          content: Text(errorMessage.value),
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
    } catch (e) {
      loading.value = false;
      print("Error fetching users: $e");
      errorMessage.value = "Error fetching users";
      Get.defaultDialog(
        title: "Error",
        content: Text(errorMessage.value),
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
  }
}


