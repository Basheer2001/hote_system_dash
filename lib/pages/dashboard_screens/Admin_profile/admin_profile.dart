import 'dart:io';
import 'package:dashboardhs/pages/dashboard_screens/Admin_profile/updateprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/adminprofile_controller/adminprofile_controller.dart';


class AdminProfile extends StatelessWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AdminProfileController controller = Get.put(AdminProfileController());
    //final BookingRoomController bookingController = Get.put(BookingRoomController());
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Set background color
      body: Obx(() {
        if (controller.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        var profile = controller.profileData.value;

        return SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // Avatar and Update Button Section
              Center(
                child: Column(
                  children: [
                    Obx(() => CircleAvatar(
                      radius: 45,
                      backgroundImage: controller.avatarImagePath.value.isEmpty
                          ? null
                          : FileImage(File(controller.avatarImagePath.value)),
                    )),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => UpdateProfile());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF003398)),
                        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                        elevation: MaterialStateProperty.all<double>(10),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Text("Update Profile", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              // Personal Information Section
              const Text(
                'Personal Information',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              buildInfoTile('First Name', profile['first_name'] ?? ''),
              buildInfoTile('Last Name', profile['last_name'] ?? ''),
              buildInfoTile('Phone', profile['phone'] ?? ''),
              buildInfoTile('Address', profile['address'] ?? ''),

              SizedBox(height: 20.0),

              // My Bookings Section
              const Text(
                'My Bookings',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              buildBookingTile(
                'Booking 1', // Replace with actual booking details
                '24th June 2024 - 25th June 2024', // Replace with actual booking details
                onTap: () async {
                  try {
                   // await bookingController.fetchMyBookings();
               //     Get.to(() => MyBookings());
                  } catch (e) {
                    print('Error fetching bookings: $e');
                    Get.snackbar(
                      'Error',
                      'Failed to fetch bookings. Please try again later.',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
              ),

              SizedBox(height: 20.0),

              // Notification Settings Section
              Text(
                'Notification Settings',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                color: Colors.white,
                child: ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Receive Push Notifications',
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(Icons.arrow_back_ios),
                    ],
                  ),
                  onTap: () {
                    // Update notification setting
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // Helper method to build information tiles
  Widget buildInfoTile(String title, String subtitle) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white60,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.edit),
        onTap: () {
          // Navigate to edit screen
        },
      ),
    );
  }

  // Helper method to build booking tiles with custom card design
  Widget buildBookingTile(String title, String subtitle, {VoidCallback? onTap}) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Colors.white60,
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        title: Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        onTap: onTap,
        trailing: ElevatedButton(
          onPressed: () {
           // Get.to(() => BookingFormPage());
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF003398)),
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            ),
            elevation: MaterialStateProperty.all<double>(10),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child: Text('Book Room', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
