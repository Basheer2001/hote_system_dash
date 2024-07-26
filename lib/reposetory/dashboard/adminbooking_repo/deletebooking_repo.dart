import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';


class DeleteBookingRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  final MyServices myServices = Get.find<MyServices>();



  Future<void> deleteBooking(int bookingId) async {
    try {
      String? token = myServices.getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.deleteRequest(
        "${APIProvider.url}dashboard/destroy/bookings/$bookingId",
        headers: {'Authorization': 'Bearer $token'},
      );

      print("Response status code: ${response.statusCode}");
      if (response.statusCode != 200) {
        throw Exception('Failed to delete booking');
      }
    } catch (e) {
      print("Error deleting booking: $e");
      throw e;
    }
  }
}
