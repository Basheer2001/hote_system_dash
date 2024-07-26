import 'package:dashboardhs/contsant/room/roomclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/managingrooms_controller/adminroom_controller.dart';
// Adjust the path as needed

/*class AdminAllRooms extends StatelessWidget {
  final AdminRoomController adminRoomController = Get.put(AdminRoomController());

  @override
  Widget build(BuildContext context) {
    // Fetch rooms when the widget is built
    adminRoomController.getAllRooms();

    return Scaffold(
      appBar: AppBar(
        title: Text('All Rooms'),
      ),
      body: Center(
        child: Obx(() {
          if (adminRoomController.isLoading.value) {
            return CircularProgressIndicator();
          } else if (adminRoomController.rooms.isEmpty) {
            return Text('No rooms available');
          } else {
            return ListView.builder(
              itemCount: adminRoomController.rooms.length,
              itemBuilder: (context, index) {
                RoomDetail room = adminRoomController.rooms[index];
                return ListTile(
                  title: Text('Room ${room.roomNumber}'),
                  subtitle: Text('Status: ${room.status}, Floor: ${room.floor}'),
                  leading: Image.network(room.photo), // Assuming photo is a URL
                  onTap: () {
                    // Navigate to room details page or show details dialog
                    // Example: Get.to(() => RoomDetailsPage(roomId: room.id));
                  },
                );
              },
            );
          }
        }),
      ),
    );
  }
}*/

class AdminAllRooms extends StatelessWidget {
  final AdminRoomController adminRoomController = Get.put(AdminRoomController());

  @override
  Widget build(BuildContext context) {
    // Fetch rooms when the widget is built
    adminRoomController.getAllRooms();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Obx(() {
          if (adminRoomController.isLoading.value) {
            return CircularProgressIndicator();
          } else if (adminRoomController.rooms.isEmpty) {
            return Text('No rooms available');
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the number of columns as per your design
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8, // Adjust the aspect ratio for card-like appearance
              ),
              itemCount: adminRoomController.rooms.length,
              itemBuilder: (context, index) {
                RoomDetail room = adminRoomController.rooms[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      // Navigate to room details page or show details dialog
                      // Example: Get.to(() => RoomDetailsPage(roomId: room.id));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                            child: Image.network(
                              room.photo, // Assuming photo is a URL
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Room ${room.roomNumber}',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.blue,
                                    blurRadius: 2.0,
                                    offset: Offset(4.0,4.0),
                                  )
                                ]

                                ),
                              ),
                              SizedBox(height: 4),
                              Text('Status: ${room.status}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14  ),),

                              Text('Floor: ${room.floor}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14  ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}