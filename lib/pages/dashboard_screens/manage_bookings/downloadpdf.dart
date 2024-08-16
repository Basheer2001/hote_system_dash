import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/manage_bookings/downloadpdf_controller.dart';

/*
class IndexServices extends StatelessWidget {
  final DownloadpdfController controller = Get.put(DownloadpdfController()); // Initialize GetX controller

  @override
  Widget build(BuildContext context) {
    // Example services for testing
    controller.services.value = [
      {"id": 1, "name": "Service 1", "description": "Desc 1", "price": 100, "duration": "1h"},
      {"id": 2, "name": "Service 2", "description": "Desc 2", "price": 200, "duration": "2h"},
      // Add more services if needed
    ];

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
                    trailing: IconButton(
                      icon: Icon(Icons.download),
                      onPressed: () {
                        controller.downloadInvoice(service['id']);
                      },
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
}*/


class InvoiceScreen extends StatelessWidget {
  final DownloadInvoiceController controller = Get.find<DownloadInvoiceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoices'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Download and display the invoice with ID 3
            controller.downloadInvoice(3);
          },
          child: Text('Download and View Invoice'),
        ),
      ),
    );
  }
}
