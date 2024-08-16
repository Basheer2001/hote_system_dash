import 'package:dashboardhs/pages/dashboard_screens/managing_rooms/adminallrooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../contsant/routes.dart';
import 'Admin_profile/admin_profile.dart';
import 'manage_bookings/optionbookingscreen.dart';
import 'managing_report/checkmultipereports.dart';
import 'managing_report/reports1.dart';
import 'managing_report/showsomeonereport.dart';
import 'managing_rooms/optionroomscreen.dart';
import 'managing_services/optionservicescreen.dart';
import 'managing_users/optionuserscreen.dart';



class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ValueNotifier<bool> isExpandedNotifier = ValueNotifier<bool>(false);
  int _selectedIndex = 0;

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
      // Navigate to Home screen
        break;
      case 1:
        Get.to(()=>Reports());
        break;
      case 2:
      // Navigate to Profile screen
        Get.toNamed(AppRoute.loginadmin); // Navigate to LoginAdmin screen using GetX navigation
        break;
      case 3:
        Get.to(()=>ReportUpdateScreen());
        break;
      case 4:
        Get.to(()=>OptionScreen());
        break;
      case 5:
        Get.to(()=>OptionUserScreen());
        break;
      case 6:
        Get.to(()=>OptionBookingScreen());
        break;
      case 7:
        Get.to(()=>OptionServcieScreen());
        break;
      default:


        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: isExpandedNotifier,
            builder: (context, isExpanded, child) {
              return NavigationRail(
                extended: isExpanded,
                backgroundColor: Colors.black,
                unselectedIconTheme: IconThemeData(color: Colors.blue),
                unselectedLabelTextStyle: TextStyle(color: Colors.blue),
                selectedIconTheme: IconThemeData(color: Colors.blue),
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text("Home"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.bar_chart),
                    label: Text("Rapports"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text("Profile"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text("Settings"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.hotel),
                    label: Text("Rooms"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.supervised_user_circle_outlined),
                    label: Text("Users"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.book),
                    label: Text("Bookings"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.room_service),
                    label: Text("Services"),
                  ),
                ],
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                    _navigateToPage(index);
                  });
                },
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            isExpandedNotifier.value = !isExpandedNotifier.value;
                          },
                          icon: Icon(Icons.menu),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to AdminProfile screen
                            Get.to(() => AdminProfile());
                          },
                          child: CircleAvatar(
                           /* backgroundImage: NetworkImage(
                                "https://www.google.com/imgres?q=avatar%20ui%20faces%20images&imgurl=https%3A%2F%2Fmighty.tools%2Fmockmind-api%2Fcontent%2Fhuman%2F57.jpg&imgrefurl=https%3A%2F%2Fuifaces.co%2F&docid=yoLj36mDBGaFuM&tbnid=XWZAF3gnHjR6YM&vet=12ahUKEwi5g4_bjpWHAxU47LsIHcv4BT4QM3oECG8QAA..i&w=1024&h=1024&hcb=2&ved=2ahUKEwi5g4_bjpWHAxU47LsIHcv4BT4QM3oECG8QAA"),*/
                            radius: 26.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.article, size: 26, color: Colors.black),
                                      SizedBox(width: 10),
                                      Text(
                                        "Articles",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "6 Articles",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.article, size: 26, color: Colors.red),
                                      SizedBox(width: 10),
                                      Text(
                                        "Comment",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "+3.2 Comments",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.people, size: 26, color: Colors.amber),
                                      SizedBox(width: 10),
                                      Text(
                                        "Subscribes",
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "3.2M Subscribers",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.monetization_on_outlined, size: 26, color: Colors.green),
                                      SizedBox(width: 15),
                                      Text(
                                        "Revenue",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "2,300\$",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "6 Articles",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "3 new Articles",
                              style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Container(
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Type Article Title",
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black26,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back, color: Colors.blue),
                          label: Text(
                            "2022.july 14,july 15 ,july 16",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        Row(
                          children: [
                            DropdownButton(
                                hint: Text("Filtered by"),
                                items: [
                                  DropdownMenuItem(value: "Date", child: Text("Date")),
                                  DropdownMenuItem(value: "Comments", child: Text("Comments")),
                                  DropdownMenuItem(value: "Views", child: Text("Views")),
                                ],
                                onChanged: (value) {}),
                            SizedBox(width: 20),
                            DropdownButton(
                                hint: Text("Order by"),
                                items: [
                                  DropdownMenuItem(value: "Date", child: Text("Date")),
                                  DropdownMenuItem(value: "Comments", child: Text("Comments")),
                                  DropdownMenuItem(value: "Views", child: Text("Views")),
                                ],
                                onChanged: (value) {}),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DataTable(
                          headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.grey.shade200),
                          columns: [
                            DataColumn(
                              label: Text("ID"),
                            ),
                            DataColumn(
                              label: Text("Article Title"),
                            ),
                            DataColumn(
                              label: Text("Creation Date"),
                            ),
                            DataColumn(
                              label: Text("View"),
                            ),
                            DataColumn(
                              label: Text("Comments"),
                            )
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text("0")),
                              DataCell(Text("Flutter for your first project")),
                              DataCell(Text("${DateTime.now()}")),
                              DataCell(Text("2.3M Views")),
                              DataCell(Text("102 Comments")),
                            ]),
                            DataRow(cells: [
                              DataCell(Text("1")),
                              DataCell(Text("How to build a Flutter Mobile App")),
                              DataCell(Text("${DateTime.now()}")),
                              DataCell(Text("21.3K Views")),
                              DataCell(Text("102 Comments")),
                            ])
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "1",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "2",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "3",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "See All",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}