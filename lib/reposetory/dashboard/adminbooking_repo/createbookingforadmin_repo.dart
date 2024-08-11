import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';


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
      );


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
