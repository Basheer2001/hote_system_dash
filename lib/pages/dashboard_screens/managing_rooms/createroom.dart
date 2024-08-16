
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../../controllers/managingrooms_controller/cdroom_controller.dart';


class AdminCreateRoom extends StatelessWidget {
  final CDRoomController controller = Get.put(CDRoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Room'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<CDRoomController>(
          builder: (_) => Form(
            key: controller.formKey,
            child: ListView(
              children: [
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: controller.avatarImagePath.value.isEmpty
                          ? null
                          : FileImage(File(controller.avatarImagePath.value)),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: () => controller.pickImage(context),
                      ),
                    ),
                  ],
                )),
                TextFormField(
                  controller: controller.floorTextController,
                  decoration: InputDecoration(labelText: 'Floor',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Floor is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.statusTextController,
                  decoration: InputDecoration(labelText: 'Status',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Status is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.roomNumberTextController,
                  decoration: InputDecoration(labelText: 'Room Number',
                      border: OutlineInputBorder(),

                ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Room Number is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.roomClassIdTextController,
                  decoration: InputDecoration(labelText: 'Room Class ID',
                    border: OutlineInputBorder(),

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Room Class ID is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.viewTextController,
                  decoration: InputDecoration(labelText: 'View',
                    border: OutlineInputBorder(),

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'View is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.0),
                Obx(() => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    ),
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                    controller.createRoom();
                  },
                  child: controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Text('Create Room'),
                ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
