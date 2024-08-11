import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/showallbookings/showallbookingsclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/manage_bookings/showallbookings_controller.dart';
import '../../../../controllers/managingrooms_controller/adminroom_controller.dart';



/*class ShowAllBookingsScreen extends StatelessWidget {
  final ShowAllBookingsController bookingController = Get.put(ShowAllBookingsController());

  @override
  Widget build(BuildContext context) {
    bookingController.showallBookings();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Bookings'),
      ),
      body: Obx(() {
        if (bookingController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (bookingController.bookings.isEmpty) {
          return Center(child: Text('No bookings found.'));
        } else {
          return ListView.builder(
            itemCount: bookingController.bookings.length,
            itemBuilder: (context, index) {
              final booking = bookingController.bookings[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(booking.name[0]),
                ),
                title: Text(booking.name),
                subtitle: Text(booking.checkInDate.toIso8601String()),
                onTap: () {
                  // Navigate to booking details or perform other actions
                },
              );
            },
          );
        }
      }),
    );
  }
}*/
class  ShowAllBookingsScreen extends StatelessWidget {
  final ShowAllBookingsController bookingController = Get.put(ShowAllBookingsController());


  @override
  Widget build(BuildContext context) {
    // Fetch rooms when the widget is built
    bookingController.showallBookings();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Obx(() {
          if (bookingController.isLoading.value) {
            return CircularProgressIndicator();
          } else if (bookingController.bookings.isEmpty) {
            return Text('No rooms available');
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the number of columns as per your design
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8, // Adjust the aspect ratio for card-like appearance
              ),
             // itemCount: adminRoomController.rooms.length,
              itemCount: bookingController.bookings.length,
              itemBuilder: (context, index) {
                Booking book = bookingController.bookings[index];
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Room ${book.id}',
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
                              Text('Status: ${book.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14  ),),

                              Text('Floor: ${book.checkInDate}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14  ),),
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