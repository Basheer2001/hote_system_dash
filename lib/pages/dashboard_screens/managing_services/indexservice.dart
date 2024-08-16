

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/manage_service/index_service_controller.dart';

/*
class IndexServices extends StatelessWidget {
  final IndexServicesController controller = Get.put(IndexServicesController()); // Initialize GetX controller

  @override
  Widget build(BuildContext context) {
    controller.fetchServices();
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Services'),
      ),
      body: Center(
        child: Obx(() {
          if (controller.loading.value) {
            return CircularProgressIndicator();
          } else {
            if (controller.services.isEmpty) {
              return Text('No services available.');
            }
            return ListView.builder(
              itemCount: controller.services.length,
              itemBuilder: (context, index) {
                var service = controller.services[index];
                return ListTile(
                  title: Text('${service["name"]}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(service["description"]),
                      Text('Price: \$${service["price"]}'),
                      Text('Duration: ${service["duration"]}'),
                    ],
                  ),
                  isThreeLine: true,
                );
              },
            );
          }
        }),
      ),
    );
  }
}
*/
class IndexServices extends StatelessWidget {
  final IndexServicesController controller = Get.put(IndexServicesController()); // Initialize GetX controller

  @override
  Widget build(BuildContext context) {
    // Fetch the services when the widget is built
    controller.fetchServices();

    return Scaffold(
      appBar: AppBar(
        title: Text('View All Services'),
      ),
      body: Center(
        child: Obx(() {
          if (controller.loading.value) {
            return CircularProgressIndicator();
          } else {
            if (controller.services.isEmpty) {
              return Text('No services available.');
            }
            return ListView.builder(
              itemCount: controller.services.length,
              itemBuilder: (context, index) {
                var service = controller.services[index];

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      '${service["name"]}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(service["description"]),
                        SizedBox(height: 4),
                        Text('Price: \$${service["price"]}'),
                        SizedBox(height: 4),
                        Text('Duration: ${service["duration"]}'),
                      ],
                    ),
                    isThreeLine: true,
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
