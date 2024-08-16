import 'dart:io';

import 'package:dashboardhs/pages/dashboard_screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminroom_repo/update_room_repo.dart';

class UpdateRoomController extends GetxController {
  final UpdateRoomRepo updateRoomRepo = Get.find<UpdateRoomRepo>();

  TextEditingController floorTextController=TextEditingController();
  TextEditingController statusTextController=TextEditingController();
  TextEditingController roomnumberTextController=TextEditingController();
  TextEditingController roomclassidTextController=TextEditingController();
  TextEditingController  averageratingTextController=TextEditingController();
  TextEditingController  photoTextController=TextEditingController();
  TextEditingController  viewcontroller=TextEditingController();

  var loginLoadingState=false.obs;

  var token = "".obs;
  var avatarImagePath = ''.obs;

  var firstSubmit =false.obs;
  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  /*void updateRoom({
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
  }*/


  void roomupdate() async{
    firstSubmit.value=true;
    File? imageFile;
    if (avatarImagePath.value.isNotEmpty) {
      imageFile = File(avatarImagePath.value);
    }
      AppResponse response=await updateRoomRepo.updateRoom
        (
        floorTextController.text,statusTextController.text,
          roomnumberTextController.text,roomclassidTextController.text,averageratingTextController.text,imageFile,
           viewcontroller.text
      );
      loginLoadingState.value=false;
      if(response.success){
        Get.to(() => DashboardScreen());
        Get.defaultDialog(
            title: "Success",
            content: Text(""),
            actions: [
              TextButton(onPressed: (){
                Get.back();
              },
                  child: Text("ok")),
            ]
        );
      }else{
        Get.defaultDialog(
            title: "Error",
            content: Text(response.errorMessage!),
            actions: [
              TextButton(onPressed: (){
                Get.back();
              },
                  child: Text("ok")),
            ]
        );

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

