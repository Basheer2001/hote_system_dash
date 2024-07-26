

import 'package:get/get.dart';

import '../../../pages/dashboard_screens/manage_bookings/bookingclass.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';


class BookingDetailsRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  final MyServices myServices = Get.find<MyServices>();

  Future<Booking> getBookingDetails(int bookingId) async {
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

      print("Response data: ${response.data}");

      if (response.statusCode == 200) {
        return Booking.fromJson(response.data['msg']['booking']);
      } else {
        throw Exception('Failed to fetch booking details');
      }
    } catch (e) {
      print("Error fetching booking details: $e");
      throw e;
    }
  }
}
