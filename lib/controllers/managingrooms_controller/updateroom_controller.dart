import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminroom_repo/update_room_repo.dart';

class UpdateRoomController extends GetxController {
  final UpdateRoomRepo updateRoomRepo = Get.find<UpdateRoomRepo>();

  RxBool isLoading = false.obs;

  void updateRoom({
    required int roomId,
    required String floor,
    required String status,
    required int roomNumber,
    required int roomClassId,
    required double averageRating,
    //required String photo,
    required String view,
  }) async {
    isLoading.value = true;

    AppResponse<void> response = await updateRoomRepo.updateRoom(
      roomId: roomId,
      floor: floor,
      status: status,
      roomNumber: roomNumber,
      roomClassId: roomClassId,
      averageRating: averageRating,
      //photo: photo,
      view: view
    );

    isLoading.value = false;

    if (response.success) {
      Get.snackbar(
        "Success",
        response.errorMessage ?? "Room updated successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.defaultDialog(
        title: "Error",
        content: Text(response.errorMessage ?? "Unknown error occurred"),
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
