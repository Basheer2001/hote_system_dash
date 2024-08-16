import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../reposetory/dashboard/adminroom_repo/deleteroom_repo.dart';
import '../../reposetory/dashboard/adminuser_repo/deleteuser_repo.dart';


/*
class DeleteRoomController extends GetxController {
  final DeleteRoomRepo deleteroomRepo = Get.find<DeleteRoomRepo>();
  final TextEditingController userIdController = TextEditingController();

  var deletionLoading = false.obs;

  void deleteRoom() async {
    try {
      deletionLoading.value = true;
      String userId = userIdController.text.trim();

      // Call the repo method to delete the user
      await deleteroomRepo.deleteRoom(userId);

      // Show success dialog upon successful deletion
      Get.defaultDialog(
        title: "Success",
        content: Text("User deleted successfully"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
    } catch (e) {
      // Show error dialog if deletion fails
      Get.defaultDialog(
        title: "Error",
        content: Text("Failed to delete user: $e"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
    } finally {
      deletionLoading.value = false;
    }
  }

  @override
  void dispose() {
    userIdController.dispose();
    super.dispose();
  }
}*/
class DeleteRoomController extends GetxController {
  final DeleteRoomRepo deleteroomRepo = Get.find<DeleteRoomRepo>();
  final TextEditingController userIdController = TextEditingController();

  var deletionLoading = false.obs;

  void deleteUser() async {
    try {
      deletionLoading.value = true;
      String userId = userIdController.text.trim();

      // Call the repo method to delete the user
      await deleteroomRepo.deleteRoom(userId);

      // Show success dialog upon successful deletion
      Get.defaultDialog(
        title: "Success",
        content: Text("User deleted successfully"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
    } catch (e) {
      // Show error dialog if deletion fails
      Get.defaultDialog(
        title: "Error",
        content: Text("Failed to delete user: $e"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
    } finally {
      deletionLoading.value = false;
    }
  }

  @override
  void dispose() {
    userIdController.dispose();
    super.dispose();
  }
}