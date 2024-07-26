import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/managinguser_controller/viewallusers_controller.dart';


class ViewAllUsers extends StatelessWidget {
  final  ViewAllUsersController controller = Get.put( ViewAllUsersController()); // Initialize GetX controller

  @override
  Widget build(BuildContext context) {
    controller.fetchUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Users'),
      ),
      body: Center(
        child: Obx(() {
          if (controller.loading.value) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount:controller.users.length,
              itemBuilder: (context, index) {
                var user =controller.users[index];
                return ListTile(
                  title: Text('${user["first_name"]} ${user["last_name"]}'),
                  subtitle: Text(user["email"]),
                  // Add more fields as needed
                );
              },
            );
          }
        }),
      ),
    );
  }
}


