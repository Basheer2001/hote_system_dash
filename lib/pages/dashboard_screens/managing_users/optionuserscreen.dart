import 'package:dashboardhs/pages/dashboard_screens/managing_users/searchuserbyname.dart';
import 'package:dashboardhs/pages/dashboard_screens/managing_users/viewall_users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'banunban_user.dart';
import 'create_user.dart';
import 'delete_user.dart';
import 'getuserprofile.dart';


class OptionUserScreen extends StatelessWidget {
  OptionUserScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  final List<Widget> _widgetOptions = [
    CreateUser(),
    DeleteUser(),
    BanUnbanUser(),
    ViewAllUsers(),
    SearchUserByName(),
    GetUserProfileScreen(userId: 4),
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
                        'Users',
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
                    icon: Icon(Icons.add),
                    selectedIcon: Icon(Icons.add),
                    label: Text('Create User'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.delete),
                    selectedIcon: Icon(Icons.delete),
                    label: Text('Delete User'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.block), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.block),
                    label: Text('Ban User'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.remove_red_eye), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.remove_red_eye),
                    label: Text('View All Users'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.search), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.search),
                    label: Text('Search User'), // Label for CreateRoomAdmin
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person), // Icon for CreateRoomAdmin
                    selectedIcon: Icon(Icons.person),
                    label: Text('Get User Profile '), // Label for CreateRoomAdmin
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

