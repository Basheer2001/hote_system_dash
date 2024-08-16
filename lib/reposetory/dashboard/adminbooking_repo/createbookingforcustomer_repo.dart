import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';

/*class CreateBookingForCustomerRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  final MyServices myServices = Get.find<MyServices>();

  Future<AppResponse<String>> createBookingForCustomer({
    required String userId,
    required int roomId,
    required String checkInDate,
    required String checkOutDate,
    required int numAdults,
    required int numChildren,
    required String paymentMethod,
  }) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/create/forCustomer",
        {},
        {
          "user_id":userId,
          "room_id": roomId,
          "check_in_date": checkInDate,
          "check_out_date": checkOutDate,
          "num_adults": numAdults,
          "num_children": numChildren,
          "payment_method": paymentMethod,
        },
        token: 'Bearer ${myServices.sharedPreferences.getString("token")}',
      );

      if (response.statusCode == 200) {
        return AppResponse<String>(
          success: true,
          data: response.data["data"],
        );
      } else {
        return AppResponse<String>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error creating booking",
        );
      }
    } on dio.DioException catch (e) {
      print("Dio error during booking creation: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during booking creation: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}*/


class CreateBookingForCustomerRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<Map<String, dynamic>>> createBooking({
    required String userid,
    required String roomId,
    required String checkInDate,
    required String checkOutDate,
    required String numAdults,
    required String numChildren,
    required String paymentMethod,
  }) async {
    try {
      var formData = dio.FormData.fromMap({
        "user_id": userid,
        "room_id": roomId,
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