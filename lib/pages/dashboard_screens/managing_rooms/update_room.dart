import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/managingrooms_controller/updateroom_controller.dart';

class AdminUpdateRoom extends StatelessWidget {
  final UpdateRoomController controller = Get.put(UpdateRoomController());

  final TextEditingController floorController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController roomNumberController = TextEditingController();
  final TextEditingController roomClassIdController = TextEditingController();
  final TextEditingController averageRatingController = TextEditingController();
  final TextEditingController photoController = TextEditingController();
  final TextEditingController viewController = TextEditingController();

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
            TextField(
              controller: floorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Floor',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: statusController,
              decoration: InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: roomNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Room Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: roomClassIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Room Class ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: averageRatingController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Average Rating',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: photoController,
              decoration: InputDecoration(
                labelText: 'Photo URL',
                border: OutlineInputBorder(),
              ),
            ),SizedBox(height: 16.0),
            TextField(
              controller: viewController,
              decoration: InputDecoration(
                labelText: 'view',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                controller.updateRoom(
                  roomId: 2, // Replace with the actual room ID
                 // floor: int.parse(floorController.text),
                  floor: floorController.text,
                  status: statusController.text,
                  roomNumber: int.parse(roomNumberController.text),
                  roomClassId: int.parse(roomClassIdController.text),
                  averageRating: double.parse(averageRatingController.text),
                 // photo: photoController.text,
                  view: viewController.text,
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
