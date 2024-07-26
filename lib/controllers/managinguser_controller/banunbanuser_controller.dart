import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminuser_repo/banunbanuser_repo.dart';


class BanUnbanController extends GetxController {
  BanUnbanRepo banUnbanRepo = Get.find<BanUnbanRepo>();

  var responseMessage = ''.obs;
  var loading = false.obs;
  var errorMessage = ''.obs;

  void banUser(int userId) async {
    await _changeUserStatus(userId, 'ban');
  }

  void unbanUser(int userId) async {
    await _changeUserStatus(userId, 'unban');
  }

  Future<void> _changeUserStatus(int userId, String action) async {
    loading.value = true;
    AppResponse<Map<String, dynamic>> response = action == 'ban'
        ? await banUnbanRepo.banUser(userId)
        : await banUnbanRepo.unbanUser(userId);
    loading.value = false;

    if (response.success) {
      responseMessage.value = response.data!["msg"] ?? "User has been $action.";
      Get.defaultDialog(
        title: "Success",
        content: Text(responseMessage.value),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
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
  }



}
