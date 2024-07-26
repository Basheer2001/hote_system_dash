import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service.dart';
import '../../../controllers/adminprofile_controller/loginadmin_controller.dart';


class LoginAdmin extends GetView<loginAdminController> {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(loginAdminController());
    return Scaffold(
      body: Row(
        children: [
         IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back)),
          Expanded(
            child: Container(
              color: Colors.blueAccent, // Just a placeholder color
              child: Image.asset(
                'assets/images/i.png', // Replace with your image path
                fit: BoxFit.cover, // Cover the whole container
              ),
            ),
          ),
          // Second half: Login Form
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600), // Constrain the max width for better readability on large screens
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust horizontal padding as needed
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                      crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch content horizontally
                      children: [
                        SizedBox(height: 10), // Top space
                        Text(
                          "Sign In",
                          style: TextStyle(color: Colors.black, fontSize: 35),
                          textAlign: TextAlign.center, // Center align the text
                        ),
                        SizedBox(height: 6), // Space between title and subtitle
                        Text(
                          "Hii Welcome back, you have been missed",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                          textAlign: TextAlign.center, // Center align the text
                        ),
                        SizedBox(height: 50), // Space below subtitle
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                "Email",
                                style: TextStyle(color: Colors.black, fontSize: 13),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: TextFormField(
                                controller: controller.usernameTextController,
                                autovalidateMode: !controller.firstSubmit.value
                                    ? AutovalidateMode.disabled
                                    : AutovalidateMode.always,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Required Field";
                                  } else if (!GetUtils.isEmail(value)) {
                                    return "Wrong Email";
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  hintText: '8'.tr,
                                  hintStyle: TextStyle(color: Colors.grey),
                                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  suffixIcon: Icon(Icons.email, color: Colors.grey), // Email icon on the right side
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                "Password",
                                style: TextStyle(color: Colors.black, fontSize: 13),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Obx(() => TextFormField(
                                controller: controller.PasswordTextController,
                                autovalidateMode: !controller.firstSubmit.value
                                    ? AutovalidateMode.disabled
                                    : AutovalidateMode.always,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Required Field";
                                  }
                                  return null;
                                },
                                obscureText: controller.obscureText.value, // Use obscureText.value to toggle visibility
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  hintText: '',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.toggleObscureText(); // Toggle obscureText value
                                    },
                                    child: Icon(
                                      controller.obscureText.value ? Icons.visibility : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              )),
                            ),

                          ],
                        ),

                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            controller.loginadmin();
                          },
                          //Color.fromARGB(255, 43, 116, 254)
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
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
                            "Sign In",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            // Above content
                            SizedBox(height: 20), // Space before divider (adjust as needed)

                            // Divider with text
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      "or sign up with",
                                      style: TextStyle(fontSize: 16, color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Below content
                            SizedBox(height: 20), // Space after divider (adjust as needed)
                          ],
                        ),


                        SizedBox(height: 20),
                        // Bottom space
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

