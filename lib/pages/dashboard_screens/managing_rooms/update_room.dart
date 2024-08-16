import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/managingrooms_controller/updateroom_controller.dart';
import 'dart:io';

class AdminUpdateRoom extends StatelessWidget {
  final UpdateRoomController controller = Get.put(UpdateRoomController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Room'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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

            TextField(
              controller: controller.floorTextController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Floor',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: controller.statusTextController,
              decoration: InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: controller.roomnumberTextController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Room Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: controller.roomclassidTextController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Room Class ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: controller.averageratingTextController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Average Rating',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            // TextField(
            //   controller: photoController,
            //   decoration: InputDecoration(
            //     labelText: 'Photo URL',
            //     border: OutlineInputBorder(),
            //   ),
            // ),SizedBox(height: 16.0),
            TextField(
              controller: controller.viewcontroller,
              decoration: InputDecoration(
                labelText: 'view',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                controller.roomupdate(

                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                ),
              ),
              child: Text('Update Room'),
            ),
          ],
        ),
      ),
    );
  }
}
