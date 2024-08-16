import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controllers/adminprofile_controller/adminprofile_controller.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({Key? key}) : super(key: key);

  final AdminProfileController controller = Get.find<AdminProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],

      appBar: AppBar(
          title: Text('Update Your Profile', style: TextStyle(color: Colors.blue,
            shadows: [
              Shadow(
                offset: Offset(5.0, 5.0), // Shadow position
                blurRadius: 3.0, // Shadow blur
                color: Colors.grey, // Shadow color
              ),
            ],

          )), // Adjust title color
          backgroundColor: Colors.black,
         // shape: CircularAppBarShape(),
          iconTheme: IconThemeData(color: Colors.grey)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              SizedBox(height: 30,),
              Obx(() => Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: controller.avatarImagePath.value.isEmpty
                        ? null
                        : FileImage(File(controller.avatarImagePath.value)),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () => _pickImage(),
                    ),
                  ),
                ],
              )),
              SizedBox(height: 20),
              buildTextField(controller.firstnameTextController, 'First Name', 'Enter your first name'),
              buildTextField(controller.lastnameTextController, 'Last Name', 'Enter your last name'),
              buildTextField(controller.phoneTextController, 'Phone', 'Enter your phone number', keyboardType: TextInputType.phone),
              buildTextField(controller.address, 'Address', 'Enter your address'),
              buildTextField(controller.currentpassword, 'Current Password', 'Enter your current password', obscureText: true),
              buildTextField(controller.newpasswordTextController, 'New Password', 'Enter your new password', obscureText: true),
              buildTextField(controller.newpasswordconfirmation, 'Confirm New Password', 'Confirm your new password', obscureText: true),
              SizedBox(height: 20),
              Obx(() =>
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF003398)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                      elevation: MaterialStateProperty.all<double>(10),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),),
                    onPressed: controller.loginLoadingState.value ? null : () => controller.updateprofile(),
                    child: controller.loginLoadingState.value
                        ? CircularProgressIndicator()
                        : Text('Update ', style: TextStyle(color: Colors.white)),

                  )

              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller,
      String label,
      String hint,
      {bool obscureText = false, TextInputType keyboardType = TextInputType.text}
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey, // Default border color
              width: 2.0, // Default border width, increased for boldness
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey, // Border color when focused
              width: 3.0, // Border width when focused, increased for boldness
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey, // Border color when enabled
              width: 2.0, // Border width when enabled, increased for boldness
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.red, // Border color when there's an error
              width: 2.0, // Border width when there's an error, increased for boldness
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.red, // Border color when focused and there's an error
              width: 3.0, // Border width when focused and there's an error, increased for boldness
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),

        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      controller.avatarImagePath.value = pickedFile.path;
    }
  }
}

