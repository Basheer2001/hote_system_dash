import 'package:dashboardhs/contsant/room/reportroomm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/managingrooms_controller/roomsearch_controller.dart';


class RoomSearch extends StatelessWidget {
  final RoomSearchController roomSearchController = Get.find<RoomSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: roomSearchController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: roomSearchController.searchTextController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a search term';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: roomSearchController.viewTextController,
                decoration: InputDecoration(
                  labelText: 'View',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a view';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: roomSearchController.statusTextController,
                decoration: InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a status';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(

                onPressed: roomSearchController.searchRooms,
                child: Text('Search'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Adjust padding as needed
                  ),),
              ),
              SizedBox(height: 16),
              Obx(() {
                if (roomSearchController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (roomSearchController.rooms.isEmpty) {
                  return Center(child: Text('No rooms available'));
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: roomSearchController.rooms.length,
                    itemBuilder: (context, index) {
                      final room = roomSearchController.rooms[index];
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Room Number: ${room.roomNumber}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('ID: ${room.id}'),
                              Text('Floor: ${room.floor}'),
                              Text('Status: ${room.status}'),
                              Text('Room Class ID: ${room.roomClassId}'),
                              Text('Average Rating: ${room.averageRating}'),
                              Text('View: ${room.view}'),
                              Text('Created At: ${room.createdAt}'),
                              Text('Updated At: ${room.updatedAt}'),
                              SizedBox(height: 8),
                              Text(
                                'Room Class',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Class Name: ${room.roomClass.className}'),
                              Text('Base Price: ${room.roomClass.basePrice}'),
                              Text('Bed Type: ${room.roomClass.bedType}'),
                              Text('Number of Beds: ${room.roomClass.numberOfBeds}'),
                              Text('Created At: ${room.roomClass.createdAt}'),
                              Text('Updated At: ${room.roomClass.updatedAt}'),
                              SizedBox(height: 8),
                              Text(
                                'Bookings',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}







