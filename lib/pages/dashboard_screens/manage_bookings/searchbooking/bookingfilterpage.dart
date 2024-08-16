import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/manage_bookings/searchbooking_controller/filterbookingpage_controller.dart';
import 'filteredbookingpage.dart';


/*class BookingFilterPage extends StatelessWidget {
  final BookingFilterController filterController = Get.find<BookingFilterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Bookings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User ID Input
            TextField(
              controller: filterController.userIdController,
              decoration: InputDecoration(labelText: 'User ID'),
            ),
            SizedBox(height: 16),

            // Payment Method Dropdown
            InputDecorator(
              decoration: InputDecoration(
                labelText: 'Payment Method',
                border: OutlineInputBorder(),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: filterController.selectedPaymentMethod.value,
                  onChanged: (value) {
                    filterController.selectedPaymentMethod.value = value!;
                  },
                  items: <String>['cash', 'stripe'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Number of Adults Input
            TextField(
              controller: filterController.numAdultsController,
              decoration: InputDecoration(labelText: 'Number of Adults'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Number of Children Input
            TextField(
              controller: filterController.numChildrenController,
              decoration: InputDecoration(labelText: 'Number of Children'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Date Range Picker
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      DateTimeRange? dateRange = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (dateRange != null) {
                        filterController.setDateRange(dateRange);
                      }
                    },
                    child: Text('Select Date Range'),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  filterController.startDate.value != null
                      ? '${filterController.startDate.value} - ${filterController.endDate.value}'
                      : 'No date range selected',
                ),
              ],
            ),
            SizedBox(height: 16),

            // Apply Filter Button
            ElevatedButton(
              onPressed: () {
                filterController.filterBookings();
                Get.to(() => FilteredBookingsPage());
              },
              child: Text('Apply Filter'),
            ),
          ],
        ),
      ),
    );
  }
}*/
