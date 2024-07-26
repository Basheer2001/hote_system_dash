
import 'package:dashboardhs/pages/dashboard_screens/managing_rooms/search_room.dart';
import 'package:dashboardhs/pages/dashboard_screens/managing_rooms/update_room.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'adminallrooms.dart';
import 'adminroomdetails.dart';
import 'createroom.dart';
import 'deleteroom.dart';

class OptionScreen extends StatelessWidget {
  OptionScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  final List<Widget> _widgetOptions = [
    AdminAllRooms(),
    AdminRoomDetails(),
    AdminCreateRoom(),
    AdminDeleteRoom(),
    AdminUpdateRoom(),
    RoomSearch(),
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
                        'Rooms',
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
                    icon: Icon(Icons.meeting_room),
                    selectedIcon: Icon(Icons.meeting_room),
                    label: Text('Display All Rooms'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.info),
                    selectedIcon: Icon(Icons.info),
                    label: Text('Display Room Details'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.add), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.add),
                    label: Text('Create Room'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.delete), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.delete),
                    label: Text('Delete Room'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.update), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.update),
                    label: Text('Update Room'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.search), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.search),
                    label: Text('Search Room'), // Label for CreateRoomAdmin
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

