import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminuser_repo/searchuserbyname_repo.dart'; // Adjust import path as per your project structure

class SearchUserByNameController extends GetxController {
  final SearchUserByNameRepo searchUserRepo = Get.find<SearchUserByNameRepo>();

  var users = <Map<String, dynamic>>[].obs; // Observable list of users
  var loading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Optionally fetch users here on initialization
    // fetchUsersByName(''); // Example: Fetch users with empty search string
  }

  void fetchUsersByName(String name) async {
    loading.value = true;
    try {
      AppResponse<List<Map<String, dynamic>>> response = await searchUserRepo.searchUsersByName(name);
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
      print("Error searching users: $e");
      errorMessage.value = "Error searching users";
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
