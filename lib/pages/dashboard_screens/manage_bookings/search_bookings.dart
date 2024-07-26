

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/manage_bookings/searchbookings_controller.dart';

class BookingSearch extends StatelessWidget {
  final BookingSearchController controller = Get.find<BookingSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.useridTextController,
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
                controller: controller.roomidTextController,
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
                controller: controller.checkinTextController,
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
              TextFormField(
                controller: controller.checkoutTextController,
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
              TextFormField(
                controller: controller.paymentstatueTextController,
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
              TextFormField(
                controller: controller.paymentmethodTextController,
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

                onPressed: controller.searchBookings,
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
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (controller.books.isEmpty) {
                  return Center(child: Text('No rooms available'));
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.books.length,
                    itemBuilder: (context, index) {
                      final room = controller.books[index];
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(height: 8),
                             /* Text('ID: ${room.id}'),
                              Text('Floor: ${room.floor}'),
                              Text('Status: ${room.status}'),
                              Text('Room Class ID: ${room.roomClassId}'),
                              Text('Average Rating: ${room.averageRating}'),
                              Text('View: ${room.view}'),
                              Text('Created At: ${room.createdAt}'),
                              Text('Updated At: ${room.updatedAt}'),*/
                              SizedBox(height: 8),
                              Text(
                                'Room Class',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

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
