import 'dart:io';

import 'package:dashboardhs/pages/dashboard_screens/managing_rooms/serachroomclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminroom_repo/cdroom_repo.dart';

class CDRoomController extends GetxController {
  final CDRoomRepo cdRoomRepo = Get.find<CDRoomRepo>();

  RxBool isLoading = false.obs;
  var avatarImagePath = ''.obs;

  void deleteRoom(int roomId) async {
    isLoading.value = true;

    AppResponse<void> response = await cdRoomRepo.deleteRoom(roomId);

    isLoading.value = false;

    if (response.success) {
      Get.snackbar('Success', 'Room deleted successfully');

    } else {
      Get.defaultDialog(
        title: "Error",
        content: Text(response.errorMessage ?? 'An error occurred'),
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


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController floorTextController = TextEditingController();
  TextEditingController statusTextController = TextEditingController();
  TextEditingController roomNumberTextController = TextEditingController();
  TextEditingController roomClassIdTextController = TextEditingController();
  TextEditingController viewTextController = TextEditingController();



  void createRoom() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      String floor = floorTextController.text;
      String status = statusTextController.text;
      String roomNumber = roomNumberTextController.text;
     // int roomClassId = int.tryParse(roomClassIdTextController.text) ?? 0;
      String roomClassId = roomClassIdTextController.text;
      String view = viewTextController.text;
      File? imageFile;
      if (avatarImagePath.value.isNotEmpty) {
        imageFile = File(avatarImagePath.value);
      }
      AppResponse<Room> response = await cdRoomRepo.createRoom(
        floor: floor,
        status: status,
        roomNumber: roomNumber,
        roomClassId: roomClassId,
        photo: imageFile,
        view: view,
      );

      isLoading.value = false;

      if (response.success) {
        Get.snackbar('Success', 'Room created successfully');
      } else {
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
  void pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      avatarImagePath.value = pickedFile.path;
      // image = File(pickedFile.path);
    }
  }
}
