

import 'package:dashboardhs/pages/dashboard_screens/managing_services/showservicebyid.dart';
import 'package:dashboardhs/pages/dashboard_screens/managing_services/storeservice.dart';
import 'package:dashboardhs/pages/dashboard_screens/managing_services/updateservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'deleteservice.dart';
import 'indexservice.dart';

class OptionServcieScreen extends StatelessWidget {
  OptionServcieScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  final List<Widget> _widgetOptions = [
    IndexServices(),
    StoreService(),
    ShowServiceByIdPage(),
    UpdateServicePage(),
    DeleteService(),
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
                        'Services',
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
                    icon: Icon(Icons.room_service),
                    selectedIcon: Icon(Icons.room_service),
                    label: Text('Display All services'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.store),
                    selectedIcon: Icon(Icons.store),
                    label: Text('Store Services'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.remove_red_eye), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.remove_red_eye),
                    label: Text('Show Service By id'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.update), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.update),
                    label: Text('Update Service'), // Label for CreateRoomAdmin
                  ),

                  NavigationRailDestination(
                    icon: Icon(Icons.delete), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.delete),
                    label: Text('Delete Service'), // Label for CreateRoomAdmin
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
