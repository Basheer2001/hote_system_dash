import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminprofile_repo/adminprofilerepo.dart';


class AdminProfileController extends GetxController{

  AdminProfileRepo adminprofileRepo=Get.find<AdminProfileRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();



  var token = "".obs;

  var firstSubmit =false.obs;

  var loginLoadingState=false.obs;
  var avatarImagePath = ''.obs;

  //var bookings = <Booking>[].obs;



  @override
  void onInit() {
    super.onInit();
    MyProfile();

  }

  var profileData = {}.obs;
  var loading = false.obs;
  var errorMessage = ''.obs;

  void MyProfile() async {
    loading.value = true;
    AppResponse<Map<String, dynamic>> response = await adminprofileRepo.MyProfile();
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









  void pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      avatarImagePath.value = pickedFile.path;
      // image = File(pickedFile.path);
    }
  }

}