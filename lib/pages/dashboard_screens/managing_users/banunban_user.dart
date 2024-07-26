import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/managinguser_controller/banunbanuser_controller.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class BanUnbanUser extends StatelessWidget {
  final TextEditingController userIdController = TextEditingController();
  final Color customColor = Color.fromRGBO(255, 160, 42, 1.0);
  final BanUnbanController banUnbancontroller = Get.find<BanUnbanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ban/Unban User'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              TextField(
                controller: userIdController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: "Enter the user id",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String userId = userIdController.text;
                  if (userId.isNotEmpty) {
                    int id = int.parse(userId);
                    banUnbancontroller.banUser(id);
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please enter a valid User ID',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: Text('Ban User', ),
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
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String userId = userIdController.text;
                  // Call unbanUser method when it's implemented
                  Get.snackbar(
                    'User Unbanned',
                    'User $userId has been unbanned',
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                },
                child: Text('Unban User',),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

