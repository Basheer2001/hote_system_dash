import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/managingrooms_controller/adminroom_controller.dart';

class AdminRoomDetails extends StatelessWidget {
  final AdminRoomController controller = Get.put(AdminRoomController());

  @override
  Widget build(BuildContext context) {
    final int roomId = 3; // Example room ID
    controller.fetchRoomDetails(roomId);

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Obx(() {
            if (controller.isLoading.value) {
              return CircularProgressIndicator();
            } else if (controller.roomDetail.value == null) {
              return Text('No room details available');
            } else {
              final roomDetail = controller.roomDetail.value!;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Basic Details',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                      child: DataTable(
                        columnSpacing: 30,
                        headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.grey.shade200),
                        columns: [
                          DataColumn(label: Text("ID")),
                          DataColumn(label: Text("Room Number")),
                          DataColumn(label: Text("Floor")),
                          DataColumn(label: Text("Status")),
                          DataColumn(label: Text("Created At")),
                          DataColumn(label: Text("Updated At")),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text("${roomDetail.id}")),
                            DataCell(Text("${roomDetail.roomNumber}")),
                            DataCell(Text("${roomDetail.floor}")),
                            DataCell(Text("${roomDetail.status}")),
                            DataCell(Text("${roomDetail.createdAt}")),
                            DataCell(Text("${roomDetail.updatedAt}")),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Room Class Details',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                      child: DataTable(
                        columnSpacing: 30,
                        headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.grey.shade200),
                        columns: [
                          DataColumn(label: Text("Room Class ID")),
                          DataColumn(label: Text("Class Name")),
                          DataColumn(label: Text("Base Price")),
                          DataColumn(label: Text("Bed Type")),
                          DataColumn(label: Text("Number of Beds")),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text("${roomDetail.roomClassId}")),
                            DataCell(Text("${roomDetail.roomClass.className}")),
                            DataCell(Text("${roomDetail.roomClass.basePrice}")),
                            DataCell(Text("${roomDetail.roomClass.bedType}")),
                            DataCell(Text("${roomDetail.roomClass.numberOfBeds}")),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Average Rating',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                      child: DataTable(
                        columnSpacing: 30,
                        headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.grey.shade200),
                        columns: [
                          DataColumn(label: Text("Average Rating")),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text("${roomDetail.averageRating}")),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
