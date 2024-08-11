import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';

class BookingForCustomerRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<Map<String, dynamic>>> createBooking({
    required int roomId,
    required int userId,
    required String checkInDate,
    required String checkOutDate,
    required int numAdults,
    required int numChildren,
    required String paymentMethod,
  }) async {
    try {
      var formData = dio.FormData.fromMap({
        "room_id": roomId,
        "user_id": userId,
        "check_in_date": checkInDate,
        "check_out_date": checkOutDate,
        "num_adults": numAdults,
        "num_children": numChildren,
        "payment_method": paymentMethod,
      });

      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/create/forCustomer",
        {},
        formData,
      );


      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AppResponse<Map<String, dynamic>>(success: true, data: response.data);
      } else {
        String errorMessage = "Booking request failed with status code ${response.statusCode}";
        if (response.data != null && response.data is Map<String, dynamic> && response.data['msg'] != null) {
          errorMessage = response.data['msg'];
        }
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: errorMessage,
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
