import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminuser_repo/createuser_repo.dart';




class CreateUserController extends GetxController {
  final CreateUserRepo registerRepo = Get.find<CreateUserRepo>();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController firstnameTextController =
  TextEditingController(text: "ahemad");
  TextEditingController lastnameTextController =
  TextEditingController(text: "beyrouthy");
  TextEditingController passwordTextController =
  TextEditingController(text: "3320233202");
  TextEditingController confirmationTextController =
  TextEditingController(text: "3320233202");
  TextEditingController phoneTextController =
  TextEditingController(text: "1231231");
  TextEditingController addressTextController =
  TextEditingController(text: "Syria");
  TextEditingController personalidTextController =
  TextEditingController(text: "1asd");
  TextEditingController bioTextController = TextEditingController(text: "hi");
  TextEditingController permissionidTextController =
  TextEditingController(text: "1");
  TextEditingController emailTextController =
  TextEditingController(text: "maniaapo48@gmail.com");

  var firstSubmit = false.obs;
  var registerLoadingState = false.obs;
  var avatarImagePath = ''.obs;
  var agreeTermsCondition = false.obs;

  void registerUser() async {
    firstSubmit.value = true;
    if (formkey.currentState!.validate()) {
      registerLoadingState.value = true;

      File? imageFile;
      if (avatarImagePath.value.isNotEmpty) {
        imageFile = File(avatarImagePath.value);
      }

      AppResponse<Map<String, dynamic>> response = await registerRepo.createUser(
        firstname: firstnameTextController.text,
        lastname: lastnameTextController.text,
        password: passwordTextController.text,
        confirmation: confirmationTextController.text,
        phone: phoneTextController.text,
        address: addressTextController.text,
        bio: bioTextController.text,
        personalid: personalidTextController.text,
        email: emailTextController.text,
        permissionid: permissionidTextController.text,
        photo: imageFile,
      );

      registerLoadingState.value = false;

      if (response.success) {
        Get.defaultDialog(
          title: "Success",
          content: Text("User registration successful"),
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

  void pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      avatarImagePath.value = pickedFile.path;
    }
  }
}