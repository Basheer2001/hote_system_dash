import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';


/*
class CreateBookingForAdminRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<Map<String, dynamic>>> createBooking({
    required String roomId,
    required String checkInDate,
    required String checkOutDate,
    required String numAdults,
    required String numChildren,
    required String paymentMethod,
  }) async {
    try {
      var formData = dio.FormData.fromMap({
        "room_id": roomId,
        "check_in_date": checkInDate,
        "check_out_date": checkOutDate,
        "num_adults": numAdults,
        "num_children": numChildren,
        "payment_method": paymentMethod,
      });

      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/create/bookings",
        {},
        formData,
        cookies: APIProvider.cookies?.first,
      );

      APIProvider.cookies = response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AppResponse<Map<String, dynamic>>(success: true, data: response.data);
      } else {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: "Booking request failed with status code ${response.statusCode}",
        );
      }
    } catch (e) {
      print("Error during booking: $e");
      return AppResponse<Map<String, dynamic>>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}
*/
class CreateBookingForAdminRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<Map<String, dynamic>>> createBooking({
    required String roomId,
    required String checkInDate,
    required String checkOutDate,
    required String numAdults,
    required String numChildren,
    required String paymentMethod,
  }) async {
    try {
      var formData = dio.FormData.fromMap({
        "room_id": roomId,
        "check_in_date": checkInDate,
        "check_out_date": checkOutDate,
        "num_adults": numAdults,
        "num_children": numChildren,
        "payment_method": paymentMethod,
      });

      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/create/bookings",
        {},
        formData,
        cookies: APIProvider.cookies?.first,
      );

      APIProvider.cookies = response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Check if response data is null or contains the expected structure
        if (response.data != null && response.data['data'] != null) {
          return AppResponse<Map<String, dynamic>>(success: true, data: response.data);
        } else {
          throw Exception("Unexpected response structure or null data.");
        }
      } else {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: "Booking request failed with status code ${response.statusCode}",
        );
      }
    } catch (e, stacktrace) {
      print("Error during booking: $e");
      print("Stacktrace: $stacktrace");

      return AppResponse<Map<String, dynamic>>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}