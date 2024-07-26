

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';

class UpdateBookingStatueRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  final MyServices myServices = Get.find<MyServices>();


  Future<AppResponse<void>> updatePaymentStatus(int bookingId, String status) async {
    try {
      dio.Response response = await apiProvider.putRequest(
        "${APIProvider.url}dashboard/bookings/$bookingId/payment-status",
        {},
        {'status': status},
        headers: {
          'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
      );

      if (response.statusCode == 200) {
        return AppResponse<void>(success: true);
      } else {
        return AppResponse<void>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error updating payment status",
        );
      }
    } on dio.DioException catch (e) {
      print("Dio error during payment status update: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during payment status update: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }


}