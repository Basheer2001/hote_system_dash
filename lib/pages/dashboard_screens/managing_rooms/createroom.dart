import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                TextFormField(
                  controller: controller.floorTextController,
                  decoration: InputDecoration(labelText: 'Floor'),
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
                  decoration: InputDecoration(labelText: 'Status'),
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
                  decoration: InputDecoration(labelText: 'Room Number'),
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
                  decoration: InputDecoration(labelText: 'Room Class ID'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Room Class ID is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.photoTextController,
                  decoration: InputDecoration(labelText: 'Photo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Photo is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.viewTextController,
                  decoration: InputDecoration(labelText: 'View'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'View is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.0),
                Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                    controller.createRoom();
                  },
                  child: controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Text('Create Room'),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
