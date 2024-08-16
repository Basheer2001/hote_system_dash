

import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/searchbooking/search_bookings.dart';
import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/showallbookings/showallbookings.dart';
import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/updatebookingstatue.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../reposetory/dashboard/adminbooking_repo/downloadinvocierepo.dart';
import '../managing_services/indexservice.dart';
import 'bookingdetail/bookingdetailsscreen.dart';

import 'createbookingforadmin.dart';
import 'createbookingforcustomer.dart';
import 'deletebookingclass.dart';
import 'downloadpdf.dart';

class OptionBookingScreen extends StatelessWidget {
  OptionBookingScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  final List<Widget> _widgetOptions = [
    ShowAllBookingsScreen(),
    BookingSearch(),
    CreateBookingForAdmin(),
    CreateBookingForCustomer(),
    ShowBookingDetailsScreen(),
    DeleteBookingScreen(),
    InvoiceScreen(),
    UpdatePaymentStatusPage(),
  ];

  void _onItemTapped(int index) {
    _selectedIndexNotifier.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          ValueListenableBuilder<int>(
            valueListenable: _selectedIndexNotifier,
            builder: (context, _selectedIndex, child) {
              return NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onItemTapped,
                backgroundColor: Colors.black,
                unselectedIconTheme: const IconThemeData(color: Colors.blue),
                unselectedLabelTextStyle: const TextStyle(color: Colors.blue),
                selectedIconTheme: const IconThemeData(color: Colors.blue),
                selectedLabelTextStyle: const TextStyle(color: Colors.blue),
                labelType: NavigationRailLabelType.all,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Get.back();
                        },
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Bookings',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    selectedIcon: Icon(Icons.remove_red_eye_outlined),
                    label: Text('ShowAllBookings'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.search),
                    selectedIcon: Icon(Icons.search),
                    label: Text('Search Bookings'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.book_online), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.book_online),
                    label: Text('Booking For Admin'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.book_online), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.book_online),
                    label: Text('Booking For User'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.details), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.details),
                    label: Text('Booking Details'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.delete), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.delete),
                    label: Text('Delete'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.download), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.download),
                    label: Text('download'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.update), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.update),
                    label: Text('update'), // Label for CreateRoomAdmin
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: _selectedIndexNotifier,
              builder: (context, _selectedIndex, child) {
                return _widgetOptions[_selectedIndex];
              },
            ),
          ),
        ],
      ),
    );
  }
}
