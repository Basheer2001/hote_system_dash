import 'package:dashboardhs/providers/apiprovider.dart';
import 'package:dashboardhs/reposetory/dashboard/adminbooking_repo/bookingdetail_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminbooking_repo/bookingforcustomer_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminbooking_repo/createbookingforadmin_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminbooking_repo/createbookingforcustomer_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminbooking_repo/deletebooking_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminbooking_repo/downloadinvocierepo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminbooking_repo/searchbookings_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminbooking_repo/showallbookings_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminbooking_repo/updatepaymentstatue_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminprofile_repo/adminprofilerepo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminprofile_repo/loginadmin_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminreport_repo/checkmultiplereports_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminreport_repo/showactivereport_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminreport_repo/showsomeonereport_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminroom_repo/adminroomgetrepo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminroom_repo/cdroom_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminroom_repo/deleteroom_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminroom_repo/searchroom_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminroom_repo/update_room_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminservice/deleteservice_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminservice/indexservice_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminservice/showservicebyid_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminservice/storeservice_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminservice/updateservice_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminuser_repo/banunbanuser_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminuser_repo/createuser_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminuser_repo/deleteuser_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminuser_repo/getuserprofile_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminuser_repo/searchuserbyname_repo.dart';
import 'package:dashboardhs/reposetory/dashboard/adminuser_repo/viewallusers_repo.dart';
import 'package:dashboardhs/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/manage_bookings/downloadpdf_controller.dart';
import 'controllers/manage_bookings/searchbooking_controller/searchbookings_controller.dart';
import 'controllers/manage_bookings/updatebookingstatue.dart';
import 'controllers/managingrooms_controller/roomsearch_controller.dart';
import 'controllers/managinguser_controller/banunbanuser_controller.dart';
import 'service.dart';
import 'controllers/adminprofile_controller/loginadmin_controller.dart';
import 'contsant/routes.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>APIProvider());
    Get.lazyPut(()=>LoginAdminRepo());
    Get.lazyPut(() =>loginAdminController());
    Get.lazyPut(()=>AdminProfileRepo());
    Get.lazyPut(()=>AdminRoomRepo());
    Get.lazyPut(()=>CDRoomRepo());
    Get.lazyPut(()=>UpdateRoomRepo());
    Get.lazyPut(()=>CreateUserRepo());
    Get.lazyPut(()=>DeleteUserRepo());
    Get.lazyPut(()=>BanUnbanRepo ());
    Get.lazyPut(()=>BanUnbanController());
    Get.lazyPut(()=>ViewAllUsersRepo());
    Get.lazyPut(()=>SearchUserByNameRepo());
    Get.lazyPut(()=>RoomSearchRepo());
    Get.lazyPut(()=> GetUserProfileRepo());
    Get.lazyPut(()=> ShowSomeonereportRepo());
    Get.lazyPut(()=> ReportRepo());
    Get.lazyPut(()=>CheckMultipleReportsRepo());
    Get.lazyPut(()=>ShowAllBookingsRepo());
    Get.put(BookingSearchRepo());
    Get.put(BookingSearchController());
    Get.lazyPut(()=>  RoomSearchController());
    Get.lazyPut(()=>  BanUnbanController());
    Get.lazyPut(()=>  DeleteRoomRepo());
   Get.lazyPut(()=> PaymentStatusRepo());
    Get.lazyPut(()=>CreateBookingForAdminRepo());
    Get.lazyPut(()=>BookingForCustomerRepo());
    Get.lazyPut(()=>DeleteBookingRepo());
    Get.lazyPut(()=>   CreateBookingForCustomerRepo());
    Get.lazyPut(()=> IndexServicesRepo());
    Get.lazyPut(()=> StoreServiceRepo());
    Get.lazyPut(()=> ShowServiceByIdRepo());
    Get.lazyPut(()=> UpdateServiceRepo());
    Get.lazyPut(()=> DeleteServiceRepo());
    Get.lazyPut(()=> DownloadInvoiceRepo());
    Get.lazyPut(()=> ShowBookingDetailsRepo());
    Get.lazyPut(()=> PaymentStatusController());
    Get.put(DownloadInvoiceRepo());
    Get.put(DownloadInvoiceController());














    Get.lazyPut(() => MyServices().init()); // Ensure this is the correct class
  }}




  void main() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
      //debugShowMaterialGrid: true, // Enables debug paint size
    //  showSemanticsDebugger: true,
     // initialRoute:AppRoute.loginadmin,
      getPages: routes,
    );
  }
}


