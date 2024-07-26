import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/manage_bookings/deletebooking_controller.dart';


class DeleteBookingsScreen extends StatelessWidget {
  final DeleteBookingController controller = Get.put(DeleteBookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Bookings'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.bookings.isEmpty) {
          return Center(child: Text('No bookings found.'));
        } else {
          return ListView.builder(
            itemCount: controller.bookings.length,
            itemBuilder: (context, index) {
              final booking = controller.bookings[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(booking.name[0]),
                ),
                title: Text(booking.name),
                subtitle: Text(booking.date.toIso8601String()),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    bool confirm = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Delete Booking'),
                        content: Text('Are you sure you want to delete this booking?'),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          TextButton(
                            child: Text('Delete'),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ],
                      ),
                    );
                    if (confirm) {
                      controller.deleteBooking(int.parse(booking.id));
                    }
                  },
                ),
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
}
