

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/appresponse.dart';
import '../../pages/dashboard_screens/dashboard_screen.dart';
import '../../reposetory/dashboard/adminprofile_repo/adminprofilerepo.dart';


class AdminProfileController extends GetxController{

  AdminProfileRepo adminprofileRepo=Get.find<AdminProfileRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  TextEditingController firstnameTextController=TextEditingController(text:"marloo");
  TextEditingController lastnameTextController=TextEditingController(text:"bb");
  TextEditingController phoneTextController=TextEditingController(text:"111");
  TextEditingController newpasswordTextController=TextEditingController(text:"87654321");
  TextEditingController  newpasswordconfirmation=TextEditingController(text:"87654321");
  TextEditingController  currentpassword=TextEditingController(text:"87654321");
  TextEditingController  address=TextEditingController(text:"321");



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


  void updateprofile() async {
    firstSubmit.value = true;
    if (formKey.currentState!.validate()) {
      loginLoadingState.value = true;
      File? imageFile;
      if (avatarImagePath.value.isNotEmpty) {
        imageFile = File(avatarImagePath.value);
      } //
      AppResponse response = await adminprofileRepo.updateprofile(
          photo: imageFile, firstnameTextController.text,
          lastnameTextController.text,
          phoneTextController.text, newpasswordTextController.text,
          newpasswordconfirmation.text, currentpassword.text, address.text

      );
      loginLoadingState.value = false;
      if (response.success) {
        Get.to(() => DashboardScreen());
        Get.defaultDialog(
            title: "Success",
            content: Text(""),
            actions: [
              TextButton(onPressed: () {
                Get.back();
              },
                  child: Text("ok")),
            ]
        );
      } else {
        Get.defaultDialog(
            title: "Error",
            content: Text(response.errorMessage!),
            actions: [
              TextButton(onPressed: () {
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
  }}