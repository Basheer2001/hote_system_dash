import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/managinguser_controller/createuser_controller.dart';





class CreateUser extends GetView<CreateUserController> {
  const CreateUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CreateUserController());

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
        child: Container(

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formkey,
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () =>

                              controller.pickImage(context),

                          child: Obx(
                                ()=> CircleAvatar(
                              minRadius: 35,
                              maxRadius: 35,
                              backgroundImage:
                              controller.avatarImagePath.value.isEmpty
                                  ?null
                                  :FileImage(File(controller.avatarImagePath.value)) ,

                              child: controller.avatarImagePath.isEmpty
                                  ? Icon(Icons.add_a_photo) // Display an icon if no image is selected
                                  : null,
                            ),)
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.firstnameTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "first_name",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.lastnameTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "last_name",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.permissionidTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "personalId",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.passwordTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters long";
                        }
                        // Ensure password and confirmation match
                        if (value != controller.confirmationTextController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Enter password",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.confirmationTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters long";
                        }
                        // Ensure password and confirmation match
                        if (value != controller.passwordTextController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "confrim password",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.addressTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "address",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.personalidTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "personal_id",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.phoneTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "phone number",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          ),                   ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.bioTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "bio",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                        () => TextFormField(
                      autovalidateMode: !controller.firstSubmit.value
                          ? AutovalidateMode.disabled
                          : AutovalidateMode.always,
                      controller: controller.emailTextController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Required Field";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "email",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(height: 20),


                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.registerUser();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Adjust padding as needed
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      "Created",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
