import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/dashboard_screens/manage_bookings/bookingclass.dart';
import '../../reposetory/dashboard/adminbooking_repo/deletebooking_repo.dart';


/*
class DeleteBookingController extends GetxController {
  final DeleteBookingRepo deletebookingRepo = Get.find<DeleteBookingRepo>();
  final TextEditingController userIdController = TextEditingController();

  var deletionLoading = false.obs;

  void deleteBooking() async {
    try {
      deletionLoading.value = true;
      String userId = userIdController.text.trim();

      // Call the repo method to delete the user
      await deletebookingRepo.deleteBooking(userId);

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
class DeleteBookingController extends GetxController {
  final DeleteBookingRepo deleteroomRepo = Get.find<DeleteBookingRepo>();
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
        content: Text(e.toString()), // Improved error message display
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
