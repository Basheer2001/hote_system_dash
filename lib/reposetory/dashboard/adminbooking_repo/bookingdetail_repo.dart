

import 'package:dio/dio.dart'as dio;
import 'package:get/get.dart';

import '../../../contsant/sharedprefrences/shared.dart';
import '../../../pages/dashboard_screens/manage_bookings/bookingclass.dart';
import '../../../pages/dashboard_screens/manage_bookings/bookingdetail/bookingmodel.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';


/*
class AdminBookingRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>(); // Assuming APIProvider setup correctly

  Future<Booking> getBookingDetails(int bookingId) async {
    try {
      String? token = await getToken(); // Retrieve token

      dio.Response response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/show/booking/Details/$bookingId",
        {}, // Add query parameters if required
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200 && response.data['status']) {
        return Booking.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to fetch booking details');
      }
    } catch (e) {
      print("Error fetching booking details: $e");
      throw e;
    }
  }
}
*/
class ShowBookingDetailsRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  final MyServices myServices = Get.find<MyServices>();

  Future<BookingDetails> showBookingDetails(int bookingId) async {
    try {
      String? token = myServices.getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/show/booking/Details/$bookingId",
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final bookingJson = response.data['data'];
        return BookingDetails.fromJson(bookingJson);
      } else {
        throw Exception('Failed to fetch booking details');
      }
    } catch (e) {
      print("Error fetching booking details: $e");
      throw e;
    }
  }
}
