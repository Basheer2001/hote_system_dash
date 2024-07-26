import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminuser_repo/getuserprofile_repo.dart';

class GetUserProfileController extends GetxController {
  GetUserProfileRepo getUserProfileRepo = Get.find<GetUserProfileRepo>();

  var profileData = {}.obs;
  var loading = false.obs;
  var errorMessage = ''.obs;

  void getUserProfile(int userId) async {
    loading.value = true;
    AppResponse<Map<String, dynamic>> response = await getUserProfileRepo.getUserProfile(userId);
    loading.value = false;

    if (response.success) {
      profileData.value = response.data!;
    } else {
      errorMessage.value = response.errorMessage!;
      Get.defaultDialog(
        title: "Error",
        content: Text(response.errorMessage!),
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
