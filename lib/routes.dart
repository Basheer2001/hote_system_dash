import 'package:dashboardhs/pages/dashboard_screens/Admin_profile/admin_profile.dart';
import 'package:dashboardhs/pages/dashboard_screens/Admin_profile/login_admin.dart';
import 'package:dashboardhs/pages/dashboard_screens/dashboard_screen.dart';
import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/bookingdetailsscreen.dart';
import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/createbookingforadmin.dart';
import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/createbookingforcustomer.dart';
import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/deletebookingclass.dart';
import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/search_bookings.dart';
import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/showallbookings/showallbookings.dart';
import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/updatebookingstatue.dart';
import 'package:dashboardhs/pages/dashboard_screens/managing_report/showsomeonereport.dart';
import 'package:dashboardhs/pages/dashboard_screens/managing_rooms/adminallrooms.dart';
import 'package:dashboardhs/pages/dashboard_screens/managing_rooms/adminroomdetails.dart';
import 'package:get/get.dart';

import 'contsant/routes.dart';
List<GetPage<dynamic>>? routes =[
  GetPage(name: AppRoute.dashboardscreen, page: () => DashboardScreen()),
  GetPage(name:"/", page: () => LoginAdmin()),
  GetPage(name:AppRoute.loginadmin, page: () => LoginAdmin()),
  GetPage(name:AppRoute.profileadmin, page: () => AdminProfile()),
  GetPage(name:AppRoute.adminallrooms, page: () => AdminAllRooms()),
  GetPage(name:AppRoute.adminroomdetails, page: () => AdminRoomDetails()),
  GetPage(name:AppRoute.showsomeonereportscreen, page: () => ShowSomeonereportScreen(userId: 3,)),
  GetPage(name:AppRoute.showallbookingsscreen, page: () => ShowAllBookingsScreen()),
  GetPage(name:AppRoute.bookingSearch, page: () =>BookingSearch()),
  GetPage(name:AppRoute.deleteBookingsScreen, page: () => DeleteBookingScreen()),
 // GetPage(name:AppRoute.bookingDetailsScreen, page: () =>BookingDetailsScreen(bookingId: 2,)),
  GetPage(name:AppRoute.updatebookingstatue, page: () =>UpdateBookingStatue()),
//  GetPage(name:AppRoute.createbookingforadmin, page: () =>CreateBookingPage()),
  GetPage(name:AppRoute.createbookingforcustomer, page: () =>CreateBookingForCustomer()),







  

];  // Add this route
